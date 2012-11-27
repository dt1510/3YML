function [ epochs ] = find_best_epochs( x, y, untrained_net )
% find the best number of epochs to the given network

    [x2, y2] = ANNdata(x, y);
    if size(untrained_net,1) == 1   
        [untrained_net] = split_training_val(untrained_net);
        untrained_net.trainParam.epochs = 1000;
        [~, tr] = train(untrained_net, x2, y2);
        [~, index] = min(tr.vperf);
        epochs = tr.epoch(index);
        figure, plotperform(tr)
    elseif size(untrained_net,1) == 6
        epochs = zeros(1,6);
        for i = 1:6
            [untrained_net{i}] = split_training_val(untrained_net{i});
            untrained_net{i}.trainParam.epochs = 1000;
            [~, tr] = train(untrained_net{i}, x2, y2(i,:));
            [~, index] = min(tr.vperf);
            epochs(i) = tr.epoch(index);
        end
    end
end

