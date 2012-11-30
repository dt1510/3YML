function [ cbr ] = compute_means( cbr )
%COMPUTE_MEANS computes mean (average) cases.
    for emotion = 1:6
        cbr.mean_active(emotion, :) = cbr.active_count(emotion, :) / cbr.class_count(emotion);
    end
end

