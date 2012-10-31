function [ predictions, test_targets ] = cross_validate( examples, target_vector, fold_number )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    trees = {{},{},{},{},{},{}};
    [test_examples, test_targets, train_examples, train_targets] = split_data(examples, target_vector, fold_number); 
    for i = 1:6
        trees{i} = gen_tree(train_examples, train_targets, i);
    end
    
    predictions = test_trees(trees,test_examples);

end

