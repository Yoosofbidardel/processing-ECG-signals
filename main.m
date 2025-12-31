% MAIN Script to process ECG signals and visualize derived metrics.
%
% Usage:
%   Run this script from the repository root in MATLAB or Octave (with the
%   Signal Processing package). All figures are produced automatically and
%   the estimated beat rate is printed to the console.

addpath(genpath("src"));

ecgs = load_ecg_signals();

t_window = [401, 538];
qrs_window = [6451, 6498];

% Augmented limb leads
leads = compute_augmented_leads(ecgs.I, ecgs.II);
plot_augmented_leads(leads, ecgs.sampling_frequency);

% Beat rate estimation
beat_rate_bpm = compute_beat_rate(ecgs.II, ecgs.sampling_frequency);
fprintf("Estimated beat rate: %.2f bpm\n", beat_rate_bpm);

% Vectorcardiogram visualizations
vcg_t_wave = compute_vcg(ecgs.I, ecgs.II, t_window);
plot_vcg(vcg_t_wave, "VCG: T-wave segment (samples 401-538)");

vcg_qrs = compute_vcg(ecgs.I, ecgs.II, qrs_window);
plot_vcg(vcg_qrs, "VCG: QRS segment (samples 6451-6498)");
