function [ info, error_rates ] = cross_validate( examples, target_vector, fold_number )
% does one fold given a fold number between 1 and 10
%   trains 6 trees and tests predicted labels against actual labels
%   outputs a struct which stores predictions vector, confusion matrix,
%   error rate for the classifier, and precision rates, recall rates and
%   F1_measures in row vectors for each class

    num_classes = 6;
    info = struct('predictions',[],'confusion_matrix',[],'error_rate',[],'precision_rates',[],'recall_rates',[],'F1_measures',[]);
    info.precision_rates = zeros(1,num_classes);
    info.recall_rates = zeros(1,num_classes);
    info.F1_measures = zeros(1,num_classes);
    trees = cell(1,6);
    data = split_data(examples, target_vector, fold_number); 
    for i = 1:num_classes
        trees{i} = gen_tree(data.train_examples, data.train_targets, i);
    end
    
    info.predictions = testTrees(trees,data.test_examples);
    
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
    %disp(info.confusion_matrix);
    info.error_rate = get_error_rate(data.test_targets, info.predictions);
     for i = 1:num_classes
          info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
          info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
          info.F1_measures(i) = get_F1_measure(info.recall_rates(i), info.precision_rates(i));
     end

     
end

