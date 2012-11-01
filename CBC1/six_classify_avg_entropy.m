function emotion = six_classify_avg_entropy( trees, example )
% Classifies an example to one of the six emotions.


classes = zeros(1, length(trees));

for i = 1:length(trees)
    [class, avg_entropy] = bin_classify_avg_entropy(trees{i}, example);
    if class
        classes(i) = avg_entropy;
    else
        classes(i) = 2400;
    end
end

[~, emotion] = min(classes);
     
end
