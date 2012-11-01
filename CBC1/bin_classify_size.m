function [ class, size ] = bin_classify_size( tree, example )
% BIN_CLASSIFY_ENTROPY Binary classifier returning the classifiction of an
% example with respect to a tree, together with the entropy at its leaf node

if(isempty(tree.class))
    if(example(tree.op))
        [class, size] = bin_classify_size(tree.kids{2}, example);
    else
        [class, size] = bin_classify_size(tree.kids{1}, example);
    end
else
    class = tree.class;
    size = tree.size;
end

end

