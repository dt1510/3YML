function emotion = six_classify_height( trees, example )
% Classifies an example to one of the six emotions.
% First combination algorithm: by depth of the tree to the leaf node

classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, height] = bin_classify_height(trees{i}, example);
    if class
        classes(i) = height;
    else
        classes(i) = -1;
    end
end

[~, emotion] = max(classes);
     
end

