clear;
clc;
syms t
f(t) = 5*cos(2*pi*t);
T=2;
fs=50;
[t,SampledSignal] = Sampler(f,fs,T);
L=2;
Mp=5;
Quantised=Quantize(SampledSignal,L,Mp);
%% Raised Cosine, Binary 
pw=200;
PulseWidth= pw;
wind_size=1;
upsamp_signal=upsample(Quantised,PulseWidth);
Pulse=RaisedCos(0.5,8,PulseWidth);
    RCos_signal= conv(upsamp_signal,Pulse);
    RCos_signal=RCos_signal(2*8*pw:end-2*8*pw+1);
SNR_Max=25;
SNR_=1:0.25:SNR_Max;
Err= zeros(1,length(SNR_));
for i=1:length(SNR_)
    SNR=SNR_(i);
    RCos_signal=awgn(RCos_signal,SNR);
    OutSignal=RCos_signal(2*8*pw:end-2*8*pw+1);
    sig_out= downsample(OutSignal,PulseWidth);
    out =Quantize(sig_out,L,Mp);
    for k=1:length(out)
        if (out(k) ~= Quantised(k))
                   Err(1,i) = Err(1,i)+1;

        end
   end
    Err(1,i)= Err(1,i)/length(out);

end
plot(SNR_, Err); 
xlabel ('SNR'); ylabel('Bit Error Rate');