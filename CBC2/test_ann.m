function [ classification_rate, predictions ] = test_ann( x, y, neurons )
%TEST_NETWORK Summary of this function goes here
%   Detailed explanation goes here
    
    rows_in_training = round(size(x,1)*67/100);
    rows_in_testing = size(x,1) - rows_in_training;
    training_matrix = x(1:rows_in_training,:);
    training_cvector = y(1:rows_in_training);
    testing_matrix = x(rows_in_training+1:size(1,x2),:);
    testing_cvector = y(rows_in_training+1:size(1,x2));
    
    [x2, y2] = ANNdata(x, y);
    
    training_tmatrix = x2(:,1:rows_in_training);
    training_rvector = y2(1:rows_in_training);
    testing_tmatrix = x2(:,rows_in_training+1:size(1,x2));
    testing_rvector = y2(rows_in_training+1:size(1,x2));
    
    [net] = feedforwardnet(neurons,'traingd');
    [net] = configure(net, x2, y2);
    [net] = train(net, x2, y2);
    
    [t] = sim(net, x2);
    
    classification_rate = 1- sum(sum(abs(y2 - round(t))))/size(y,1);
    
    predictions = testANN(net,x2);
    
    
end

