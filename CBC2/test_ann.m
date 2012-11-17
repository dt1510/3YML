
function [ classification_rate] = test_ann( x, y, net)
%Computes a classification rate.
    [x2, y2] = ANNdata(x, y);
    predictions = testANN(net,x2);
    classification_rate = (size(y,1) - nnz(predictions - y))/size(y, 1);
end

