function [ cbr ] = compute_weights( cbr )
%COMPUTE_WEIGHTS
    for emotion = 1:6
        cbr.class_weights(emotion, :) = cbr.active_count(emotion) ./ cbr.class_count(emotion);
    end
end

