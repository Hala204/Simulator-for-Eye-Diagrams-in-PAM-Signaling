%%Noiseless Eye Diagrams
%% 2 Level PAM
clear;
syms x;
f(x) = 5*cos(2*pi*x);
f_s=200;
T=2;
[x,SampledSignal] =Sampler(f,f_s,T);
L=2;
mp=5;
QuantisedSignal=Quantize(SampledSignal,L,mp);
%% PRZ
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp);
%% PNRZ
Tp=200;%%Arbitrary pulse width
wsize=1;%%Window Size
NoiselessEyeDiagram(QuantisedSignal,'PNRZ',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'PNRZ',wsize,Tp);
%% Raised Cosine
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'RCos',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'RCos',wsize,Tp);
%%  Nyquist Pulse (Sinc)
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'Sinc',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'Sinc',wsize,Tp);
%% 4-PAM
clear;
syms t;
f(x) = 5*cos(2*pi*x);
f_s=50;%f_s is the sampling frequency
T=2;%%end of the sampling interval
[x,SampledSignal] =Sampler(f,f_s,T);
L=4;
mp=5;
QuantisedSignal=Quantize(SampledSignal,L,mp);
%% PNRZ
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'PNRZ',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'PNRZ',wsize,Tp);
%% PRZ
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp);
%% Nyquist Pulse (Sinc)
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'Sinc',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'Sinc',wsize,Tp); 
%% Raised Cosine
Tp=200;
wsize=1;
NoiselessEyeDiagram(QuantisedSignal,'RCos',wsize,Tp);
wsize=2;
NoiselessEyeDiagram(QuantisedSignal,'RCos',wsize,Tp);

%% Part (b) Noisy Eye Diagrams
%% 2-PAM
clear;
syms t;
f(x) = 5*cos(2*pi*x);
f_s=50;
T=2;
[x,SampledSignal] = Sampler(f,f_s,T);
L=2;
mp=5;
QuantisedSignal=Quantize(SampledSignal,L,mp);

%% Raised Cosine, Binary & SNR =0
Tp=200;
wsize=1;
NoisyEyeDiagram(QuantisedSignal,'RCos',wsize,Tp,0);
wsize=2;
NoisyEyeDiagram(QuantisedSignal,'RCos',wsize,Tp,0);
%% PNRZ, Binary & SNR =0
Tp=200;
wsize=1;
NoisyEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp,0);
wsize=2;
NoisyEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp,0);
%% PNRZ, Binary & SNR =10
Tp=200;
wsize=1;
NoisyEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp,10);
wsize=2;
NoisyEyeDiagram(QuantisedSignal,'PRZ',wsize,Tp,10);
%% Raised Cosine, Binary & SNR =10
Tp=200;
wsize=1;
NoisyEyeDiagram(QuantisedSignal,'RCos',wsize,Tp,10);
wsize=2;
NoisyEyeDiagram(QuantisedSignal,'RCos',wsize,Tp,10);