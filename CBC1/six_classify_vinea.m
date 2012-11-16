function emotion = six_classify_vinea( trees, example )
% Classifies an example to one of the six emotions.
% First combination algorithm: by depth of the tree to the leaf node

classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, height] = bin_classify_height(trees{i}, example);
    [class2, entropy] = bin_classify_entropy(trees{i}, example);
    [class3, avg_entropy] = bin_classify_avg_entropy(trees{i}, example);
    [class4, size] = bin_classify_size(trees{i}, example);    
    if class
        classes(i) = classes(i) + log(1/(height+1));
        classes(i) = classes(i) + log(1-entropy);
       % classes(i) = classes(i)+log(score);
        %classes(i) = classes(i) + avg_entropy*height;
    end
end

[~, emotion] = max(classes);
     
end