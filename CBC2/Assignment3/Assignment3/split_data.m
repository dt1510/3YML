function [ data ] = split_data( examples, targets , fold_number )
% Splits the entire dataset into training set and test set depending on
% which fold of the cross validation we are on. In each fold, the test set
% will be a different 10th of the whole dataset.

    data = struct('test_examples',[],'test_targets',[],'train_examples',[],'train_targets',[]);
    num_rows = size(examples, 1);
    
    if fold_number == 1
        test_start_index = 1;
        test_end_index = round(num_rows/10);
    else
        test_start_index = round(((fold_number-1)*num_rows/10)+1);
        test_end_index = round((fold_number)*num_rows/10);   
    end
    data.test_examples = examples(test_start_index:test_end_index, :);
    data.test_targets = targets(test_start_index:test_end_index);
    
    if test_start_index == 1
        train_start_index = test_end_index + 1;
        train_end_index = num_rows;
        data.train_examples = examples(train_start_index:train_end_index,:);
        data.train_targets = targets(train_start_index:train_end_index);
    elseif test_end_index == num_rows
        train_start_index = 1;
        train_end_index = test_start_index - 1;
        data.train_examples = examples(train_start_index:train_end_index,:);
        data.train_targets = targets(train_start_index:train_end_index);
    else       
        data.train_examples = examples(1:test_start_index-1,:);
        data.train_examples = vertcat(data.train_examples,examples(test_end_index+1:num_rows,:));
        data.train_targets = vertcat(targets(1:test_start_index-1),targets(test_end_index+1:num_rows));
    end
    
end

