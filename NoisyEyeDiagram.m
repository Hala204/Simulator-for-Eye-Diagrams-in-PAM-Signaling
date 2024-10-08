function [sig_out] = NoisyEyeDiagram(Signal,pshape,WindSize,PulseWidth,SNR)
T_p=PulseWidth;
upsamp_signal=upsample(Signal,PulseWidth);

if strcmp(pshape,'PNRZ')
    pulse=PNRZ(PulseWidth);
    PNRZSignal= conv(upsamp_signal,pulse);
    PNRZSignal=PNRZSignal(1:end-T_p+1);
    PNRZSignal=awgn(PNRZSignal,SNR);
    sig_out=PNRZSignal(1:end-T_p+1);
    if WindSize==1
    eyediagram(PNRZSignal,WindSize*T_p,T_p,T_p/2);
    else
    eyediagram(PNRZSignal,WindSize*T_p,T_p);
    end
elseif  strcmp(pshape,'PRZ')
    pulse = PRZ(PulseWidth);
    prz_signal= conv(upsamp_signal,pulse);
    prz_signal=prz_signal(1:end-T_p+1);
    prz_signal=awgn(prz_signal,SNR);
    sig_out=prz_signal(1:end-T_p+1);
    if WindSize==1
    eyediagram(prz_signal,WindSize*T_p,T_p,T_p/2);
    else
    eyediagram(prz_signal,WindSize*T_p,T_p);
    end
elseif strcmp(pshape,'Sinc')
    pulse=Nyquist(8,PulseWidth);
    SincSignal= conv(upsamp_signal,pulse);
    SincSignal=SincSignal(2*8*T_p:end-2*8*T_p+1);
    SincSignal=awgn(SincSignal,SNR);
    sig_out=SincSignal(2*8*T_p:end-2*8*T_p+1);
    if WindSize==1
    eyediagram(SincSignal,WindSize*T_p,T_p,T_p/2);
    else
    eyediagram(SincSignal,WindSize*T_p,T_p);
    end
elseif strcmp(pshape,'RCos')
    pulse=RaisedCos(0.5,8,PulseWidth);
    RCos_signal= conv(upsamp_signal,pulse);
    RCos_signal=RCos_signal(2*8*T_p:end-2*8*T_p+1);
    RCos_signal=awgn(RCos_signal,SNR);
    sig_out=RCos_signal(2*8*T_p:end-2*8*T_p+1);
    if WindSize==1
    eyediagram(RCos_signal,WindSize*T_p,T_p,T_p/2);
    else
    eyediagram(RCos_signal,WindSize*T_p,T_p);
    end
end
end