function [ predicted_binary_targets ] = predict_binary_targets( tree, testing_examples )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    predicted_targets = zeros(size(testing_examples, 1), 1);

    for i = 1:size(testing_examples, 1)
        predicted_targets(i) = classify(tree, testing_examples(i,:));
    end

    return
    
end

