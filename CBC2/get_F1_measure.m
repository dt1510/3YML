function F1_measure = get_F1_measure( recall_rate, precision_rate )
% Calculates the F1 measure for a specified class based on the previously
% calculated recall rate and precision rate

    if (recall_rate == -1 || precision_rate == -1 || recall_rate+precision_rate == 0)
        F1_measure = -1; 

    else
        F1_measure = (2*precision_rate*recall_rate) / (precision_rate + recall_rate);
    end

end

