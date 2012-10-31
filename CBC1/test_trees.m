function [ predicted_targets ] = test_trees( trees, examples )
%Summary of this function goes here
%   predicted_binary_targets is a matrix n*m that stores the 6 binary targets
%   from the trees, for each example. n is the number of examples, m is the
%   number of binary targets
%   targets
    predicted_targets = zeros(size(examples,1) ,1);
    predicted_binary_targets = zeros(size(examples,1),length(trees));
    for i = 1:length(trees)
        predicted_binary_targets(:,i) = predict_binary_targets(trees{i}, examples);
    end
        
    %combine outputs
    for i = 1:size(examples, 1)
        predicted_targets(i) = six_classify(trees, examples(i, :));
    end    
    return
    
end

