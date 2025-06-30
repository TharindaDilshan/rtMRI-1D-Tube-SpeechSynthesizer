function [gn]=rosenberg(N1,N2,f0,fs)
%Rosenberg Pulse
%this function accepts fundamental frequency of the glottal signal and 
%the sampling frequency in hertz as input and returns one period of 
%the rosenberg pulse at the specified frequency.
%N2 is duty cycle of the pulse, from 0 to 1.
%N1 is the duration of the glottal opening as a fraction of the 
%total pulse, from 0 to 1.

T=1/f0;     %period in seconds
pulselength=floor(T*fs);    %length of one period of pulse
%select N1 and N2 for duty cycle
N2=floor(pulselength*N2);
N1=floor(N1*N2);
gn=zeros(1,N2);
%calculate pulse samples
for n=1:N1-1
    gn(n)=0.5*(1-cos(pi*(n-1)/N1));
end
for n=N1:N2
    gn(n)=cos(pi*(n-N1)/(N2-N1)/2);
end
gn=[gn zeros(1,(pulselength-N2))];