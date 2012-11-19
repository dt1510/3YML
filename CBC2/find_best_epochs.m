function [ epochs ] = find_best_epochs( x, y, untrained_net )
% find the best number of epochs to the given network

    [x2, y2] = ANNdata(x, y);
    [untrained_net] = configure(untrained_net, x2, y2);    
    [untrained_net] = split_training_val(untrained_net);
    untrained_net.trainParam.epochs = 20;
    untrained_net.trainParam.time = 100;
    [~, tr] = train(untrained_net, x2, y2);
    [~, index] = min(tr.vperf);
    epochs = tr.epoch(index);
    figure, plotperform(tr)
end

