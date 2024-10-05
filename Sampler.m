function [t,sampled] = Sampler(mt,fs,t)
ts=1/fs;
t=0:ts:t;
sampled=zeros(1,length(t));

for i=1:length(t)
    sampled(i)= mt(t(i));
end
end