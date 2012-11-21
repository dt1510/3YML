function [ net ] = gen_bare_ann()

%generates an untrained ann. 
    
    [net] = feedforwardnet([10,10],'trainlm');
    net.layers{1}.transferFcn = 'purelin';

end