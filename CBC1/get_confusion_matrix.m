function conf_matrix = get_confusion_matrix( n, actual_labels, predicted_labels )
% Creates an nxn confusion matrix based on the output of the classifier
% Rows correspond to the actual class and columns correspond to the
% predicted class
% E.g. for 3x3 confusion matrix:
%
%           |     Predicted Class
%           |     a      b      c
% --------------------------------------
% Actual  a |
% class   b |
%         c |
%           |
%
% actual_labels is the provided y vector
% for assignment 2 (decision trees), n = 6

conf_matrix = zeros(n,n);
for i = 1:length(actual_labels)
    if actual_labels(i) == predicted_labels(i)
        conf_matrix(actual_labels(i), actual_labels(i)) = conf_matrix(actual_labels(i), actual_labels(i)) + 1;
    else
        conf_matrix(actual_labels(i), predicted_labels(i)) = conf_matrix(actual_labels(i), predicted_labels(i)) + 1;
    end
end


end

