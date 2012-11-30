function [ min_case, case_location ] = retrieve( cbr, newcase )
%RETRIEVE finds the most similar case from the cbr memory.

    %default, not initialized value, return the newcase if the memory is
    %empty.
    min_value = 1000;
    min_case = newcase;
    case_location = -1;
    for i = 1:length(cbr.cases)
            switch cbr.similarity_function
                case 'similarity_weighted'
                    value = similarity_weighted(cbr, newcase, cbr.cases(i));
                case 'similarity_entropy'
                    value = similarity_entropy(cbr, newcase, cbr.cases(i));
                otherwise                    
                    value = similarity(newcase, cbr.cases(i));
            end
            
            if value <= min_value
                    min_value = value;
                    min_case = cbr.cases(i);
                    if (value == 0)
                        case_location = i;
                    else
                        case_location = -1;
                    end
            end            
    end
end

