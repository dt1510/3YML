function [ case_struct ] = new_case_struct()
%Generates a new case structure with an empty memory that stores cases and on which operations
%like RETRIEVE can be performed.
%class_count - how many instances were classified wrt a particular class.
%class_weights - one weight row per class.
%active_count - counts how many times au was activated for every class.

cases = [];
class_weights = ones(6, 45);

case_struct = struct('cases', cases, 'class_count', zeros(6, 1), 'class_weights', class_weights, 'active_count', zeros(6, 45));

end

