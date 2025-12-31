function ecg = load_ecg_signals(data_path, sampling_frequency)
%LOAD_ECG_SIGNALS Load ECG dataset and enrich with metadata.
%
%   ECG = LOAD_ECG_SIGNALS() loads the default dataset located at
%   data/ECG1_500Hz.mat and assumes a 500 Hz sampling frequency.
%
%   ECG = LOAD_ECG_SIGNALS(DATA_PATH, FS) loads the dataset from DATA_PATH
%   and annotates it with the provided sampling frequency FS.
%
%   The returned struct contains:
%       - I, II: primary lead signals (column vectors)
%       - sampling_frequency: provided sampling rate in Hz
%       - time: time vector in seconds for the length of the signals
%
%   This helper validates that the dataset exposes the expected variables.

arguments
    data_path (1,1) string = ""
    sampling_frequency (1,1) double {mustBePositive} = 500
end

if data_path == ""
    current_dir = fileparts(mfilename("fullpath"));
    data_path = fullfile(current_dir, "..", "data", "ECG1_500Hz.mat");
end

if ~isfile(data_path)
    error("ECG data file not found: %s", data_path);
end

raw = load(data_path);

if ~isfield(raw, "I") || ~isfield(raw, "II")
    error("Dataset must contain variables named I and II.");
end

% Ensure column vector orientation for consistent downstream math.
ecg.I = raw.I(:);
ecg.II = raw.II(:);

if numel(ecg.I) ~= numel(ecg.II)
    error("Lead I and Lead II must have the same number of samples.");
end

ecg.sampling_frequency = sampling_frequency;
ecg.time = (0:numel(ecg.I) - 1).' ./ sampling_frequency;

ecg = orderfields(ecg, {"I", "II", "sampling_frequency", "time"});

end
