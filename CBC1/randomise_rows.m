function [ new_matrix ] = randomise_rows( ordered_matrix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

new_matrix = ordered_matrix(randperm(size(ordered_matrix,1)),:);


end

