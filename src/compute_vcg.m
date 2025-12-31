function vcg = compute_vcg(lead_I, lead_II, sample_window)
%COMPUTE_VCG Derive vectorcardiogram coordinates from limb leads.
%
%   VCG = COMPUTE_VCG(I, II, WINDOW) computes the X/Y trajectory for the
%   provided window of samples (inclusive) using leads I and II. WINDOW is a
%   two-element vector [START END]. If omitted, the full signal is used.

arguments
    lead_I (:,1) double
    lead_II (:,1) double
    sample_window (1,2) double = [1, numel(lead_I)]
end

if numel(lead_I) ~= numel(lead_II)
    error("Lead I and Lead II must have the same length.");
end

if sample_window(2) < sample_window(1)
    error("sample_window must be nondecreasing: [start end].");
end

start_idx = max(1, floor(sample_window(1)));
end_idx = min(numel(lead_I), ceil(sample_window(2)));
indices = start_idx:end_idx;
num_points = numel(indices);

alpha = zeros(num_points, 1);
magnitude = zeros(num_points, 1);

for k = 1:num_points
    li = lead_I(indices(k));
    lii = lead_II(indices(k));

    if li == 0 && lii == 0
        continue;
    end

    alpha(k) = atan2(0.5 * li - lii, (sqrt(3) / 2) * li);
    denom = cos(alpha(k) + pi/3);

    if abs(denom) < eps
        magnitude(k) = 0;
    else
        magnitude(k) = li / denom;
    end
end

vcg.alpha = alpha;
vcg.magnitude = magnitude;
vcg.X = magnitude .* cos(alpha);
vcg.Y = magnitude .* sin(alpha);
vcg.indices = indices(:);

vcg = orderfields(vcg, {"X", "Y", "alpha", "magnitude", "indices"});
end
