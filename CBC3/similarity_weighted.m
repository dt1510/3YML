function [ similarity_distance ] = similarity_weighted( single_case1, single_case2 )
%SIMILARITY_FUNCTION - just like a similarity function, except that the
%distance between two cases is weighted based on the attributes.
    similarity_distance = nnz(single_case1.x - single_case2.x);
end

