function [ net ] = gen_bare_ann()

%generates an untrained ann. 


    %[net] = feedforwardnet([10],'trainlm');
    %net.layers{1}.transferFcn = 'tansig';
    %net.trainParam.lr = 0.2;
    
    [net] = feedforwardnet([10,10],'trainlm');
    net.layers{1}.transferFcn = 'purelin';
    net.trainParam.min_grad = 1*(power(10,-4));
end