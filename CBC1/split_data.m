function [ test_examples, test_targets, train_examples, train_targets ] = split_data( examples, targets , fold_number )
% Splits the entire dataset into training set and test set depending on
% which fold of the cross validation we are on. In each fold, the test set
% will be a different 10th of the whole dataset.

    num_rows = size(examples, 1);
    
    if fold_number == 1
        test_start_index = 1;
        test_end_index = round(num_rows/10);
    else
        test_start_index = round((fold_number-1)*num_rows/10);
        test_end_index = round((fold_number)*num_rows/10);   
    end
    test_examples = examples(test_start_index:test_end_index, :);
    test_targets = targets(test_start_index:test_end_index);
    
    if test_start_index == 1
        train_start_index = test_end_index + 1;
        train_end_index = num_rows;
        train_examples = examples(train_start_index:train_end_index,:);
        train_targets = targets(train_start_index:train_end_index);
    elseif test_end_index == num_rows
        train_start_index = 1;
        train_end_index = test_start_index - 1;
        train_examples = examples(train_start_index:train_end_index,:);
        train_targets = targets(train_start_index:train_end_index);
    else       
        train_examples = examples(1:test_start_index-1,:);
        train_examples = vertcat(train_examples,examples(test_end_index+1:num_rows,:));
        train_targets = vertcat(targets(1:test_start_index-1),targets(test_end_index+1:num_rows));
    end
        
    return
    
end

