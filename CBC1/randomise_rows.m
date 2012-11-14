function [ new_matrix, new_targets ] = randomise_rows( ordered_matrix, target_vector )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    new_matrix = zeros(size(ordered_matrix));
    new_targets = zeros(size(ordered_matrix,1));
    random_indices = randperm(size(ordered_matrix,1));
    for i = 1:size(ordered_matrix,1)
        new_matrix(i,:) = ordered_matrix(random_indices(i),:);
        new_targets(i) = target_vector(random_indices(i));
    end
     
end

