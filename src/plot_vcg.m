function fig = plot_vcg(vcg, title_text)
%PLOT_VCG Plot a vectorcardiogram (VCG) trajectory.
%
%   FIG = PLOT_VCG(VCG, TITLE) draws the X/Y trajectory stored in the VCG
%   struct and annotates the figure with the provided title.

arguments
    vcg struct
    title_text (1,1) string = "Vectorcardiogram"
end

required_fields = ["X", "Y"];
missing = setdiff(required_fields, string(fieldnames(vcg)));
if ~isempty(missing)
    error("Missing VCG fields: %s", strjoin(missing, ", "));
end

fig = figure('Name', char(title_text), 'Color', 'w', 'NumberTitle', 'off');
plot(vcg.X, vcg.Y, 'LineWidth', 1.5);
axis equal;
grid on;
xlabel('X (mV)');
ylabel('Y (mV)');
title(title_text);
end
