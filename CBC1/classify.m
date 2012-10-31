function [ class ] = classify( tree, example )
% Takes as arguments a binary tree for a particular emotion, and a row
% vector containing the binary values for all the attributes of one example
% case. Traverses the tree for this example case and classifies it as 0
% (not having the emotion) or 1 (having the emotion).

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

