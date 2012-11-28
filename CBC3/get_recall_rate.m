function recall_rate = get_recall_rate( class, conf_matrix )
% Calculates the recall rate for a specified class based on the nxn
% confusion matrix
% class must be between 1 and length(conf_matrix)
% tp = number of true positives; fn = number of false negatives

fn = 0;

for i = 1:length(conf_matrix)
    if i==class
        tp = conf_matrix(class, i);
    else
        fn = fn + conf_matrix(class, i);
    end
end

if tp+fn == 0
    recall_rate = -1;
else
    recall_rate = (tp / (tp + fn))*100;
end



end

