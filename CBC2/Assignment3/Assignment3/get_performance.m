function [ performance, classification_rate] = get_performance( net, tr, x, y)
%Computes a classification rate.
    [x2, y2] = ANNdata(x, y);    
    predictions = testANN(net,x2);
    classification_rate = (size(y,1) - nnz(predictions - y))/size(y, 1);    
    performance = tr.best_perf;
end