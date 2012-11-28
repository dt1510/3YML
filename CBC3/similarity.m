function [ similarity_distance ] = similarity( single_case1, single_case2 )
%SIMILARITY_FUNCTION - a very simple similarity function that may get
%replaced in the future by another one taking into consideration
%information entropy for example. The lower the number, the more similar
%they are.
    similarity_distance = nnz(single_case1.x - single_case2.x);
end

