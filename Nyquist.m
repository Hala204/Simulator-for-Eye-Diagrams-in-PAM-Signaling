function [sig_out] = Nyquist(n,pw)
sig_out=sinc([-n*pw:n*pw-1]/pw);
end
