function [sigout] = PRZ(T_p)
temp_0=zeros(1,T_p);
temp_1=ones(1,T_p/2);
temp_0(T_p/4+1:0.75*T_p)=temp_1;
sigout=temp_0;
end