function [ class ] = classify( tree, example )
%CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
    if(isempty(tree.class))
        if(example(tree.op))
            class = classify(tree.kids{2}, example);
        else
            class = classify(tree.kids{1}, example);
        end
    else
        class = tree.class;
    end
    return;
end

