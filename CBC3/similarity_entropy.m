function [ similarity_distance ] = similarity_entropy( cbr, single_case1, single_case2 )
%SIMILARITY_FUNCTION - just like a similarity function, except that the
%distance between two cases is weighted based on the attributes.
    class = 1;
    if not(single_case1.y == -1)
        class = single_case1.y;
    elseif not(single_case2.y == -1)
        class = single_case2.y;
    end      
    similarity_distance = sum(abs(single_case1.x - single_case2.x) .* cbr.class_entropy(class));    
end
