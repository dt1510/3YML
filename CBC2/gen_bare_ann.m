function [ net ] = gen_bare_ann()

%generates an untrained ann. 

    [net] = feedforwardnet([15],'trainlm');
    net.layers{1}.transferFcn = 'tansig';
    %net.trainParam.lr = 0.2;
end