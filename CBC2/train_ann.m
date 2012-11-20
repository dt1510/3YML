function [ net, tr ] = train_ann( net, x, y)
%TRAIN_ANN
    unconfigure(net);
    [x2, y2] = ANNdata(x, y);
    [net] = configure(net, x2, y2);    
    [net] = split_training_val(net);
    %net.trainParam.epochs = 2;
    net.trainParam.time = 20;
    [net, tr] = train(net, x2, y2);    
end

