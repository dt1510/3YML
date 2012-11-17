function [ net ] = gen_bare_ann()
%generates an untrained ann.

    [net] = feedforwardnet([10],'trainlm');

end