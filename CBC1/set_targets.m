function [ binary_targets ] = set_targets( labels, target_label )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    binary_targets = zeros(1,length(labels));
    for i = 1:length(labels)
        if labels(i) == target_label
            binary_targets(i) = 1;
        else
            binary_targets(i) = 0;
        end
    end
   
end

