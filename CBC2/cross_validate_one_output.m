function [ info ] = cross_validate_one_output( x, y, fold_number, net )
% does one fold given a fold number between 1 and 10
%   trains a network and tests predicted labels against actual labels
%   outputs a struct which stores predictions vector, confusion matrix,
%   error rate for the classifier, and precision rates, recall rates and
%   F1_measures in row vectors for each class

    num_classes = 6;
    info = struct('predictions',[],'confusion_matrix',[],'error_rate',[],'precision_rates',[],'recall_rates',[],'F1_measures',[]);
    info.precision_rates = zeros(1,num_classes);
    info.recall_rates = zeros(1,num_classes);
    info.F1_measures = zeros(1,num_classes);
    data = split_data(x, y, fold_number); 

    test_examples = data.test_examples';
    info.predictions = testANN(net,test_examples);
    info.confusion_matrix = get_confusion_matrix(num_classes, data.test_targets, info.predictions');
    info.error_rate = get_error_rate(data.test_targets, info.predictions');
     for i = 1:num_classes
          info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
          info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
          info.F1_measures(i) = get_F1_measure(info.recall_rates(i), info.precision_rates(i));
     end

end

