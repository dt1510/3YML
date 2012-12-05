function [ y ] = get_average_F1_for_classes( conf_matrix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    y = zeros(1,6);
    for i = 1:6
        recall_rate = get_recall_rate(i, conf_matrix );
        precision_rate = get_precision_rate(i, conf_matrix);
        y(i) = get_F1_measure(recall_rate, precision_rate);
    end

end

