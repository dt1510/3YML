function [ similar_case, case_location ] = similar_case_by_mean( cbr, newcase )
%SIMILARITY_MEAN
    
    %find the most similar class            
    min_class = 1;
    min_value = 1000;
    for emotion = 1:6
        value = sum(abs(newcase.x - cbr.mean_active(emotion, :)));        
        if value <= min_value            
            min_value = value;
            min_class = emotion;
        end
    end        
    
    min_value = 1000;
    case_location = 1;    
    min_case = cbr.cases(1);
    for i = 1:length(cbr.cases)
        if cbr.cases(i).y == min_class            
            value = sum(abs(newcase.x - cbr.cases(i).x));            
            if value <= min_value
                min_value = value;
                min_case = cbr.cases(i);
                case_location = i;
            end
        end
    end
    
    similar_case = min_case;
    
end