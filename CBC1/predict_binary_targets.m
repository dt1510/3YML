function [ predicted_binary_targets ] = predict_binary_targets( tree, testing_examples )
% Calls the classify function for each example in the matrix
% testing_examples and returns a column vector whose length is the number
% of examples.

    predicted_binary_targets = zeros(size(testing_examples, 1), 1);
      
    for i = 1:size(testing_examples, 1)
        predicted_binary_targets(i,:) = classify(tree, testing_examples(i,:));
    end

    return
    
end

