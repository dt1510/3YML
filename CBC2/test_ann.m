function [ classification_rate, predictions ] = test_ann( x, y, neurons )
%TEST_NETWORK Summary of this function goes here
%   Detailed explanation goes here
    [x2, y2] = ANNdata(x, y);
    [net] = feedforwardnet([neurons],'traingd');
    [net] = configure(net, x2, y2);
    [net] = train(net, x2, y2);
    
    [t] = sim(net, x2);
    
    classification_rate = 1- sum(sum(abs(y2 - round(t))))/size(y,1);
    
    predictions = testANN(net,x2);
    
end

