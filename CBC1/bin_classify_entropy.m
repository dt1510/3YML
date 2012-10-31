function [ class, entropy ] = bin_classify_entropy( tree, example )
% BIN_CLASSIFY_ENTROPY Binary classifier returning the classifiction of an
% example with respect to a tree, together with the entropy at its leaf node

if(isempty(tree.class))
    if(example(tree.op))
        [class, entropy] = bin_classify_entropy(tree.kids{2}, example);
    else
        [class, entropy] = bin_classify_entropy(tree.kids{1}, example);
    end
else
    class = tree.class;
    entropy = tree.entropy;
end

end

