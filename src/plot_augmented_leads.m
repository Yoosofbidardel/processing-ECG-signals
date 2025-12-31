function fig = plot_augmented_leads(leads, sampling_frequency)
%PLOT_AUGMENTED_LEADS Visualize primary and augmented ECG leads.
%
%   FIG = PLOT_AUGMENTED_LEADS(LEADS, FS) plots the six limb leads using
%   subplots and returns the created figure handle. LEADS should contain
%   fields I, II, III, aVF, aVR, and aVL. FS is the sampling frequency in
%   Hz used to build a time axis.

arguments
    leads struct
    sampling_frequency (1,1) double {mustBePositive}
end

required_fields = ["I", "II", "III", "aVF", "aVR", "aVL"];
missing = setdiff(required_fields, string(fieldnames(leads)));
if ~isempty(missing)
    error("Missing lead fields: %s", strjoin(missing, ", "));
end

t = (0:numel(leads.I) - 1) ./ sampling_frequency;
lead_order = {"I", "II", "III", "aVF", "aVL", "aVR"};
colors = ["#1f77b4", "#d62728", "#9467bd", "#2ca02c", "#8c564b", "#ff7f0e"];

fig = figure('Name', 'Augmented ECG Leads', 'Color', 'w', 'NumberTitle', 'off');
for idx = 1:numel(lead_order)
    subplot(2, 3, idx);
    key = lead_order{idx};
    plot(t, leads.(key), 'Color', colors(idx));
    title(sprintf('Lead %s', key));
    xlabel('Time (s)');
    ylabel('Amplitude (mV)');
    grid on;
end

sgtitle('ECG Limb Leads');
end
