function [ class, score ] = bin_classify_combined( tree, example )

    function [class, score] = bin_classify_combined_helper( tree, example, height)
        score = 0;
        if(isempty(tree.class))
            if(example(tree.op))
                [class, score] = bin_classify_combined_helper(tree.kids{2}, example, height+1);
            else
                [class, score] = bin_classify_combined_helper(tree.kids{1}, example, height+1);
            end
        else
            class = tree.class;            
        end
        score = score + tree.entropy/height;
    end

    [class, score] = bin_classify_combined_helper( tree, example, 1);    

end