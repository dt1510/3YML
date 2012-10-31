function [ info ] = cross_validate( examples, target_vector, fold_number )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    num_classes = 6;
    info = struct('predictions',{{}},'confusion_matrix',{{}},'error_rate',{{}},'precision_rates',{{}},'recall_rates',{{}},'F1_measures',{{}});
    trees = {{},{},{},{},{},{}};
    [test_examples, test_targets, train_examples, train_targets] = split_data(examples, target_vector, fold_number); 
    for i = 1:num_classes
        trees{i} = gen_tree(train_examples, train_targets, i);
    end
    
    info.predictions = test_trees(trees,test_examples);
    info.confusion_matrix = get_confusion_matrix(num_classes, test_targets, predictions);
    info.error_rate = get_error_rate(test_targets, predictions);
     for i = 1:num_classes
          info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
          info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
          info.F1_measures(i) = get_F1_measure(info.recall_rates(i), precision_rates(i));
     end
     
end

