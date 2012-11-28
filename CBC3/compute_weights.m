function [ cbr ] = compute_weights( cbr )
%COMPUTE_WEIGHTS    
    for emotion = 1:6        
        for attr = 1:45            
            %val = (abs(cbr.active_count(emotion, attr) / cbr.class_count(emotion) - 0.5)*2);                        
            cbr.class_weights(emotion, attr) = find_entropy(cbr.active_count(emotion, attr), cbr.class_count(emotion) - cbr.active_count(emotion, attr));            
        end
    end
end

