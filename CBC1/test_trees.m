function [ predicted_targets ] = test_trees( trees, examples )

% Takes as arguments the 6 trained trees corresponding to the 6 emotions,
% and the matrix of test examples. Combines the 6 trees into one classifer,
% which is then used to predict the emotion label (from 1 to 6).
% Returns a column vector (predicted_targets) which contains the predicted
% labels for all the examples in the test set.
% Uses the predict_binary_targets function as an auxiliary function.
% predicted_binary_targets is an nxm matrix that stores the 6 binary targets
% from the trees, for each example. n is the number of examples, m is the
% number of binary targets (in this case, m=6)
% targets

    %combine outputs
    for i = 1:size(examples, 1)
        predicted_targets(i) = six_classify(trees, examples(i, :));
    end    
    return
    
end

