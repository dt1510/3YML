function [ class, avg_entropy ] = bin_classify_avg_entropy( tree, example )
    

function [class, avg_entropy] = avg_entropy_helper(tree, example, avg)
    if(isempty(tree.class))
        if(example(tree.op))
            [class, avg_entropy] = avg_entropy_helper(tree.kids{2}, example, avg+tree.entropy);
        else
            [class, avg_entropy] = avg_entropy_helper(tree.kids{1}, example, avg+tree.entropy);
        end
    else
        class = tree.class;
        avg_entropy = avg;
    end
end

[class, avg_entropy] = avg_entropy_helper(tree, example, 0);
[~, height] = bin_classify_height(tree, example);
avg_entropy = avg_entropy / height;


end

