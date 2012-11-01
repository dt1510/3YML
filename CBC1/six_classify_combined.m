function emotion = six_classify_combined( trees, example )
% Classifies an example to one of the six emotions.
% First combination algorithm: by depth of the tree to the leaf node

classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, height] = bin_classify_height(trees{i}, example);
    [class2, entropy] = bin_classify_entropy(trees{i}, example);
    [class3, score] = bin_classify_combined(trees{i}, example);
    if class
        classes(i) = classes(i) + 1/(height+1);
    end
    if class2
        classes(i) = classes(i) + 1-entropy;
    end
    if class3
        classes(i) = classes(i)+score;
    end
end

[~, emotion] = max(classes);
     
end