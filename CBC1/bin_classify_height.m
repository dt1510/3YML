function [ class, height ] = bin_classify_height( tree, example )
%BIN_CLASSIFY_HEIGHT Binary classifier returning the classifiction of an
%example with respect to a tree, together with a depth it takes to reach
%the classification leaf node.

    function [class, height] = bin_classify_height_helper( tree, example, init_height)
        if(isempty(tree.class))
            if(example(tree.op))
                [class, height] = bin_classify_height_helper(tree.kids{2}, example, init_height+1);
            else
                [class, height] = bin_classify_height_helper(tree.kids{1}, example, init_height+1);
            end
        else
            class = tree.class;
            height = init_height;
        end
    end

    [class, height] = bin_classify_height_helper( tree, example, 0);    

end

