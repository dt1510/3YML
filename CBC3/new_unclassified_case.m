function [ single_case ] = new_unclassified_case( input_vector )
%NEW_UNCLASSIFIED_CASE creates a new case when no class for it is known
%yet.
    single_case = new_case(input_vector, -1);
end

