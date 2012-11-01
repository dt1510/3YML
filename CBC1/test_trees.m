function [ predicted_targets ] = test_trees( trees, examples )

% Takes as arguments the 6 trained trees corresponding to the 6 emotions,
% and the matrix of test examples. Combines the 6 trees into one classifer,
% which is then used to predict the emotion label (from 1 to 6).
% Returns a column vector (predicted_targets) which contains the predicted
% labels for all the examples in the test set.

    %combine outputs
    for i = 1:size(examples, 1)
        predicted_targets(i) = six_classify_height(trees, examples(i, :));
    end    
    return
    
end

