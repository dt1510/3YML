function [ single_case ] = new_case( input_vector, target_value )
%CASE generates a case structure.    
    single_case = struct('x', input_vector, 'y', target_value);
end

