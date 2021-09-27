function beat_rate = pace(II)
clear all;
close all
clc;
load  ECG1_500Hz.mat

Fs=500; % sampeling frequency
T=size(II)/Fs;    % time for sampeling
for i=1:size(II)
    y(i) = II(i)>600;
end
for i=1:size(II)-1
    Dy(i) = abs(y(i+1)-y(i));  % we use this algorithm to identify upper and lower edge detectoin
end

N = sum(Dy)/2; % N time  in  T sec
beat_rate = 60*N/T(1)
end