function qunat = Quantize(signal, length, Mp)

siglen=length(signal);
qunat=zeros(1,siglen);
min=-1*Mp;
max=Mp; 
width=max-min;
step=width/(length-1);
range=min-step/2:step:max+step/2;
levels=(Mp-width:step:Mp);

for i=1:1:siglen
    for j=1:1:siglen
        if (signal(i)<=range(j+1)) && (signal(i)>range(j))
            qunat(i)=levels(j);
            break;
        end
    end
    
end

end