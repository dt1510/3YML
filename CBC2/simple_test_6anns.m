function [ net, best_val_perf, classif_rate ] = simple_test_6anns( x,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    RandStream.setGlobalStream(RandStream('mt19937ar','seed',1)); 
    [x2, y2] = ANNdata(x,y);
    net = cell(6,1);
    tr = cell(1,6);
    num_examples = size(x,1);
    total_best_val_perf = 0;

    train_end_index = round(size(x,1)*66/100);
    train_examples = x2(:, 1:train_end_index);
    train_targets = y2(:, 1:train_end_index);
    
    for i = 1:6
        net{i} = feedforwardnet([5,5],'trainlm');
        net{i}.layers{1}.transferFcn = 'tansig';    
        configure(net{i}, train_examples, train_targets);
        net{i}.divideParam.trainRatio = 100/100;
        net{i}.divideParam.valRatio = 0;
        net{i}.divideParam.testRatio = 0;
        net{i}.trainParam.min_grad = 1*(power(10,-4));
        [net{i}, ~] = train(net{i}, train_examples, train_targets(i,:));
    end
    val_examples = x2(:,train_end_index+1:num_examples);
    predictions = testANN(net,val_examples);
    classif_rate = 1 - get_error_rate(y(train_end_index+1:size(x2,2),:), predictions);
    
    for i = 1:6
        net{i} = feedforwardnet([5,5],'trainlm');
        net{i}.layers{1}.transferFcn = 'tansig';    
        configure(net{i}, x2, y2);
        net{i}.divideParam.trainRatio = 66/100;
        net{i}.divideParam.valRatio = 33/100;
        net{i}.divideParam.testRatio = 0;
        net{i}.trainParam.min_grad = 1*(power(10,-4));
        [net{i}, tr{i}] = train(net{i}, x2, y2);
        total_best_val_perf = total_best_val_perf + tr{i}.best_vperf;
    end
    best_val_perf = total_best_val_perf / 6;
    
end

