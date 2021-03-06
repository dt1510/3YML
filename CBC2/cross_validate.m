function [ info, error_rates ] = cross_validate( x, y, fold_number, net)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    num_classes = 6;
    info = struct('predictions',[],'confusion_matrix',[],'error_rate',[],'precision_rates',[],'recall_rates',[],'F1_measures',[]);
    info.precision_rates = zeros(1,num_classes);
    info.recall_rates = zeros(1,num_classes);
    info.F1_measures = zeros(1,num_classes);
    data = split_data(x, y, fold_number);
    [train_examples, train_targets] = ANNdata(data.train_examples, data.train_targets); 
    if size(net,1) == 6
        for i = 1:6
            net{i}.divideFcn = 'divideint';
            net{i}.divideParam.trainRatio = 67/100;
            net{i}.divideParam.valRatio = 33/100;
            net{i}.divideParam.testRatio = 0/100;
            [net{i}] = train(net{i}, train_examples, train_targets(i,:));           
        end
    else
        net.divideFcn = 'divideint';
        net.divideParam.trainRatio = 67/100;
        net.divideParam.valRatio = 33/100;
        net.divideParam.testRatio = 0/100;
        net = train(net, train_examples, train_targets);
    end
    [test_examples, ~] = ANNdata(data.test_examples, data.test_targets);
    info.predictions = testANN(net,test_examples);
    
    
    error_rates = zeros(6, 1);
    len = size(data.test_targets, 1);    
    bin_targets = zeros(len);
    bin_predictions = zeros(len);
    for emotion=1:6
        for i=1:len
            bin_targets(i) = data.test_targets(i) == emotion;
            bin_predictions(i) = info.predictions(i) == emotion;
        end       
        
        error_rate = nnz(bin_targets - bin_predictions)/len;        
        error_rates(emotion)=error_rate;
    end    
    
    
    info.confusion_matrix = get_confusion_matrix(num_classes, data.test_targets, info.predictions);
    disp(info.confusion_matrix);
    info.error_rate = get_error_rate(data.test_targets, info.predictions);
     for i = 1:num_classes
          info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
          info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
          info.F1_measures(i) = get_F1_measure(info.recall_rates(i), info.precision_rates(i));
     end    
end

