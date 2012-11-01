function emotion = six_classify_combined( trees, example )
% Classifies an example to one of the six emotions.
% First combination algorithm: by depth of the tree to the leaf node

classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, height] = bin_classify_height(trees{i}, example);
    [class2, entropy] = bin_classify_entropy(trees{i}, example);    
    if class && class2
        classes(i) = height / entropy;
    elseif class        
        classes(i) = height;
    else
        classes(i) = 0;
    end
end

[~, emotion] = max(classes);
     
end