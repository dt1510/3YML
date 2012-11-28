function [ single_case ] = new_case( input_vector, target_value )
%CASE generates a case structure. If there is a new case with no associated
%target value, set the value to -1.
    single_case = struct('x', input_vector, 'y', target_value, 'typicality', 1);
end

