function [ case_struct ] = add_case( case_struct, single_case )
%should try to add a case but also avoid duplicates

    for i = 1:size(case_struct)
        if single_case == case_struct.cases(i)
            return;
        end
    end
    case_struct.cases = [case_struct.cases single_case];
end

