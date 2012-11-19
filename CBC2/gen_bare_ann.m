function [ net ] = gen_bare_ann()
%generates an untrained ann.

    [net] = feedforwardnet([100],'trainlm');
    net.layers{1}.transferFcn = 'tansig';
end