function precision_rate = get_precision_rate( class, conf_matrix )
% Calculates the precision rate for a specified class based on the nxn
% confusion matrix
% class must be between 1 and length(conf_matrix)
% tp = number of true positives; fp = number of false positives

fp = 0;

for i = 1:length(conf_matrix)
    if i==class
        tp = conf_matrix(i, class);
    else
        fp = fp + conf_matrix(i, class);
    end
end

precision_rate = (tp / (tp + fp))*100;


end

