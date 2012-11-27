function [ case_struct ] = new_case( input_vector, target_value )
%CASE generates a case structure.    
    case_struct = struct('x', input_vector, 'y', target_value);
end

