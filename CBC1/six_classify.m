function emotion = six_classify( trees, example )
%Classifies an example to one of the six emotions.
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

