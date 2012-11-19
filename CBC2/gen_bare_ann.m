function [ net ] = gen_bare_ann()

<<<<<<< HEAD
=======
%generates an untrained ann. 

>>>>>>> 7ccba8c4fc0e610105e6c7d6ab23b39787c9d35a
    [net] = feedforwardnet([10],'trainlm');
    net.layers{1}.transferFcn = 'tansig';
    %net.trainParam.lr = 0.2;
end