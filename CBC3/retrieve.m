function [ min_case ] = retrieve( cbr, newcase )
%RETRIEVE finds the most similar case from the cbr memory.

    %default, not initialized value, return the newcase if the memory is
    %empty.
    min_value = 1000;
    min_case = newcase;
    for i = 1:length(cbr.cases)
            value = similarity(newcase, cbr.cases(i));
            %value = similarity_weighted(cbr, newcase, cbr.cases(i));
            if value <= min_value
                    min_value = value;
                    min_case = cbr.cases(i);
            end            
    end
end

