function [ predictions ] = cross_validate( examples, target_vector, fold_number )
% Represents one fold of the 10-fold cross validation. Calls the split_data
% function to get the training and test sets. Generates 6 trees using the
% training set by calling gen_tree. Then calls test_trees to produce the
% resulting vector of predictions for the test set.
    trees = {{},{},{},{},{},{}};
    [test_examples, test_targets, train_examples, train_targets] = split_data(examples, target_vector, fold_number); 
    for i = 1:6
        trees{i} = gen_tree(train_examples, train_targets, i);
    end
    
    predictions = test_trees(trees,test_examples);

    
end

