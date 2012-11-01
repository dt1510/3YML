function [ correctness ] = test( x, y )
%Performs simple tests to validate the correctness of our implementation.
    trees = cell(1,6);
    for i=1:6
        trees{i} = gen_tree(x, y, i);
    end

    predicted_targets = test_trees(trees, x);
    correctness = sum(predicted_targets' == y)/length(y);
    
    for i=1:length(y)
        if not(predicted_targets(i) == y(i))
            i            
        end
    
end

