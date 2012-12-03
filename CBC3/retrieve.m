function [ min_case, case_location ] = retrieve( cbr, newcase )
%RETRIEVE finds the most similar case from the cbr memory.

    %default, not initialized value, return the newcase if the memory is
    %empty.
    if strcmp(cbr.similarity_function, 'similarity_case_by_mean') == 1
        [min_case, case_location] = similarity_case_by_mean(cbr, newcase);
        return
    end
        
    min_value = 1000;
    min_case = newcase;
    typicality = 0;
    case_location = -1;
    for i = 1:length(cbr.cases)
            switch cbr.similarity_function
                case 'similarity'
                    value = similarity(newcase, cbr.cases(i));
                case 'similarity_weighted'
                    value = similarity_weighted(cbr, newcase, cbr.cases(i));
                case 'similarity_entropy'
                    value = similarity_entropy(cbr, newcase, cbr.cases(i));
                otherwise                    
                    value = similarity(newcase, cbr.cases(i));
            end
            
            if value < min_value || (value == min_value && cbr.cases(i).typicality >= typicality)
                    min_value = value;
                    min_case = cbr.cases(i);
                    typicality = cbr.cases(i).typicality;
                    if (value == 0)
                        case_location = i;
                    else
                        case_location = -1;
                    end
            end            
    end
end

