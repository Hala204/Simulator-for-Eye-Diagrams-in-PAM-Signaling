function [ signal ] = RaisedCos(Roff_factor,X,lob_tranc)
signal=rcosdesign(Roff_factor,X,lob_tranc,'normal');
end
