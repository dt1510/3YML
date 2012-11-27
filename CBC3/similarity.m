function [ similarity_distance ] = similarity( case_struct1, case_struct2 )
%SIMILARITY_FUNCTION - a very simple similarity function that may get
%replaced in the future by another one taking into consideration
%information entropy for example.
    similarity_distance = nnz(case_struct1.x - case_struct2.x);
end

