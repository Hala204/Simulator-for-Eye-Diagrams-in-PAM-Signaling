function [sig_out] = NoiselessEyeDiagram(signal,pshape,Wind_Size,Pw)
upsamp_signal=upsample(signal,Pw);
T_p=Pw;
if strcmp(pshape,'PRZ')
    Pulse = PRZ(Pw);
    PRZSignal= conv(upsamp_signal,Pulse);
    PRZSignal=PRZSignal(1:end-T_p+1);
    sig_out=PRZSignal(1:end-T_p+1);
    if Wind_Size==1
    eyediagram(PRZSignal,Wind_Size*T_p,T_p,T_p/2);
    else
    eyediagram(PRZSignal,Wind_Size*T_p,T_p);
    end
elseif strcmp(pshape,'RCos')
    Pulse=RaisedCos(0.5,8,Pw);
    RCosSignal= conv(upsamp_signal,Pulse);
    RCosSignal=RCosSignal(2*8*T_p:end-2*8*T_p+1);
    sig_out=RCosSignal(2*8*T_p:end-2*8*T_p+1);
    if Wind_Size==1
    eyediagram(RCosSignal,Wind_Size*T_p,T_p,T_p/2);
    else
    eyediagram(RCosSignal,Wind_Size*T_p,T_p);
    end
elseif strcmp(pshape,'Sinc')
    Pulse=Nyquist(8,Pw);
    SincSignal= conv(upsamp_signal,Pulse);
    SincSignal=SincSignal(2*8*T_p:end-2*8*T_p+1);
    sig_out=SincSignal(2*8*T_p:end-2*8*T_p+1);
    if Wind_Size==1
    eyediagram(SincSignal,Wind_Size*T_p,T_p,T_p/2);
    else
    eyediagram(SincSignal,Wind_Size*T_p,T_p);
    end
elseif strcmp(pshape,'PNRZ')
    Pulse=PNRZ(Pw);
    PNRZSignal= conv(upsamp_signal,Pulse);
    PNRZSignal=PNRZSignal(1:end-T_p+1);
    sig_out=PNRZSignal(1:end-T_p+1);
    if Wind_Size==1
    eyediagram(PNRZSignal,Wind_Size*T_p,T_p,T_p/2);
    else
    eyediagram(PNRZSignal,Wind_Size*T_p,T_p);
    end
end
end