function [ similarity_distance ] = similarity_function( x1, x2 )
%SIMILARITY_FUNCTION
    similarity_distance = nnz(x1 - x2);
end

