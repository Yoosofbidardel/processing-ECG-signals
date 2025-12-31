function beat_rate_bpm = compute_beat_rate(signal, sampling_frequency, threshold)
%COMPUTE_BEAT_RATE Estimate heart rate from a single ECG lead.
%
%   BPM = COMPUTE_BEAT_RATE(SIGNAL, FS) computes the beat rate in beats per
%   minute using the specified sampling frequency FS and a default
%   threshold of 600 microvolts for R-peak detection.
%
%   BPM = COMPUTE_BEAT_RATE(SIGNAL, FS, THRESHOLD) lets you override the
%   detection threshold.

arguments
    signal (:,1) double
    sampling_frequency (1,1) double {mustBePositive}
    threshold (1,1) double = 600
end

is_above = signal > threshold;
transitions = diff(is_above);
rising_edges = sum(transitions == 1);

recording_seconds = numel(signal) / sampling_frequency;
beat_rate_bpm = rising_edges * 60 / recording_seconds;
end
