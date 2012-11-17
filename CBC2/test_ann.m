
function [ performance] = test_ann( x, y, net)
%Computes a classification rate.
    [x2, y2] = ANNdata(x, y);    
    [net] = configure(net, x2, y2);
    [net] = split_training_val(net);    
    [net, tr] = train(net, x2, y2);
    predictions = testANN(net,x2);
    classification_rate = (size(y,1) - nnz(predictions - y))/size(y, 1);
    performance = classification_rate;
end

