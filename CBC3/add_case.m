function [ case_struct ] = add_case( case_struct, single_case )
%should try to add a case but also avoid duplicates

    for i = 1:size(case_struct.cases,2)
        if similarity(single_case,case_struct.cases(i))==0 && single_case.y == case_struct.cases(i).y
            case_struct.cases(i).typicality = case_struct.cases(i).typicality + 1;
            return;
        end
    end

    case_struct.cases = [case_struct.cases single_case];
    %case_struct.class_count(single_case.y) = case_struct.class_count(single_case.y) + 1;
    %case_struct.active_count(single_case.y, :) = single_case.x;    
end

