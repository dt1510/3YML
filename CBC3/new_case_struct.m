function [ case_struct ] = new_case_struct(similarity_function)
%Generates a new case structure with an empty memory that stores cases and on which operations
%like RETRIEVE can be performed.
%class_count - how many instances were classified wrt a particular class.
%class_weights - one weight row per class.
%active_count - counts how many times au was activated for every class.

cases = [];
class_weights = ones(6, 45);
mean_active = ones(6, 45);
class_entropies = ones(6, 45);

if nargin == 0
    similarity_function = 'similarity';
end

case_struct = struct('cases', cases, 'class_count', zeros(6, 1), 'class_weights', class_weights, 'class_entropies', class_entropies, 'active_count', zeros(6, 45), 'similarity_function', similarity_function, 'mean_active', mean_active);

end

