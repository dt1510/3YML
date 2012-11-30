function [ cbr ] = retain( cbr, solvedcase, case_location)
%RETAIN adds the solvedcase to the memory.

    %cbr = add_case(cbr, solvedcase)
    if ( case_location >= 0 )
        cbr.cases(case_location).typicality = cbr.cases(case_location).typicality + 1;
    elseif  (case_location == -1)
        cbr.cases = [cbr.cases solvedcase];
        cbr.class_count(solvedcase.y) = cbr.class_count(solvedcase.y) + 1;
        cbr.active_count(solvedcase.y, :) = cbr.active_count(solvedcase.y, :) + solvedcase.x; 
    end
    
end
