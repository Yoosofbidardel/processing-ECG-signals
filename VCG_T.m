function VCG_T(I,II)
clc;
clear all;
syms a  %alpha
load('F:\LEARNNNNNN\7th term\biomedical\ECG_data\ECG_data/ECG1_500Hz.mat');
j = 1;
for i=401:538
    lead_1 = I(i);
    lead_2= II(i);
    if((lead_1 == 0)&& (lead_2 == 0))  %obviouse answer
       Teta(j) = 0;
       V(j) = 0;
    else 
       eq = solve(lead_1*cos(a+(pi/3))- lead_2*cos(a)==0,a);
       Teta(j) = double(vpa(eq(1)));  %phase
       V(j) = lead_1/cos(Teta(j)); %amplitude
    end
    
    j = j+1;
end

for i=1:138
    X(i) = V(i)*cos(Teta(i));
    Y(i) = V(i)*sin(Teta(i));
end

plot(X,Y);
end