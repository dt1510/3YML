function [ cbr ] = compute_weights( cbr )
%COMPUTE_WEIGHTS
    for emotion = 1:6        
        for attr = 1:45
            cbr.class_weights(emotion, attr) = abs(cbr.active_count(emotion) / cbr.class_count(emotion) - 0.5)*2;
        end
    end
end

