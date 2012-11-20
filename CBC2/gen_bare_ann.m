function [ net ] = gen_bare_ann()

%generates an untrained ann. 

    [net] = feedforwardnet([10],'trainlm');
    net.layers{1}.transferFcn = 'tansig';
    %net.trainParam.lr = 0.2;
end