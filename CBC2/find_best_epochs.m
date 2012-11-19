function [ epochs ] = find_best_epochs( x, y, untrained_net )
% find the best number of epochs to the given network

    [x2, y2] = ANNdata(x, y);
    [net] = configure(net, x2, y2);    
    [net] = split_training_val(net);
    net.trainParam.epochs = 20;
    %net.trainParam.time = 10;
    [net, tr] = train(net, x2, y2);
    tr
    figure, plotperform(tr)
end

