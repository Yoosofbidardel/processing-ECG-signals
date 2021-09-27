function [III,aVF,aVR,aVL]=lead(I,II)
load  ECG1_500Hz.mat
III= II-I;
aVF = (III+II)/2;
aVR = (-II-I)/2;
aVL = (-III+I)/2;
subplot(231);
plot(I,'b');
xlabel('lead I');
subplot(232);
plot(II,'r');
xlabel('lead II');
subplot(233);
plot(III,'y');
xlabel('lead III');
subplot(234);
plot(aVF,'k');
xlabel('lead aVF');
subplot(235);
plot(aVL,'g');
xlabel('lead aVL');
subplot(236);
plot(aVR)
xlabel('lead aVR');
suptitle('ECG signals')
end


