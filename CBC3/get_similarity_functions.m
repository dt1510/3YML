function [ similarity_list ] = get_similarity_functions()
%Returns currently implemented similarity functions in a cell structure.
    similarity_list = {'similarity', 'similarity_entropy', 'similarity_weighted'};
end

