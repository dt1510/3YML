function [ case_struct ] = add_case( case_struct, single_case )
%should try to add a case but also avoid duplicates

    for i = 1:size(case_struct.cases,2)
        if similarity(single_case,case_struct.cases(i))==0 && single_case.y == case_struct.cases(i).y
            case_struct.typicality(i) = case_struct.typicality(i) + 1;
            return;
        end
    end

    case_struct.cases = [case_struct.cases single_case];
    case_struct.typicality = [case_struct.typicality 1];
end

