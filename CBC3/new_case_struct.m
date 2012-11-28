function [ case_struct ] = new_case_struct()
%Generates a new case structure with an empty memory that stores cases and on which operations
%like RETRIEVE can be performed.

cases = [];
typicality = [];
case_struct = struct('cases', cases, 'typicality',typicality);

end

