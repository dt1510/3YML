function emotion = six_classify_by_entropy( trees, example )
% Classifies an example to one of the six emotions.
% Second combination algorithm: by entropy of the leaf node

classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, entropy] = bin_classify_entropy(trees{i}, example);
    if class
        classes(i) = entropy;
    else
        classes(i) = 42;
    end
end

[~, emotion] = min(classes);

end

