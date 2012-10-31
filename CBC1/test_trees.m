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

    predicted_targets = zeros(size(examples,1) ,1);
    predicted_binary_targets = zeros(size(examples,1),length(trees));
    for i = 1:length(trees)
        predicted_binary_targets(:,i) = predict_binary_targets(trees{i}, examples);
    end

    %combine outputs
    for i = 1:size(examples, 1)
        labels = [];
        for j = 1:length(trees)
            if predicted_binary_targets(i,j) == 1
                labels = [labels,j];
            end
        end
        %what if there are no emotions present???
        if length(labels) == 1
            predicted_targets(i) = labels;
        elseif  length(labels) > 1
            %for now this only outputs first label no matter what
            predicted_targets(i) = labels(1);
        else
            predicted_targets(i) = 100;
        end
    end
   
    
    return
    
end

