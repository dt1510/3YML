function error = get_error_rate( actual_labels, predicted_labels )
% Calculates the error rate for a particular classifier
% Used to calculate average classification rate:
%   must run this function for each classifier produced from each of the 10
%   folds. Then take the mean over all 10 folds and calculate the average
%   classification rate:
%       classification rate = 1 - error rate

num_examples = length(actual_labels);

    function x = compares_actual_predicted(actual, predicted)
        if actual == predicted
            x = 1;
        else
            x = 0;
        end
    end

comparison_vector = zeros(num_examples, 1);
for i = 1:num_examples
    comparison_vector(i) = 1 - compares_actual_predicted(actual_labels(i), predicted_labels(i));
end

error = (1/num_examples)*sum(comparison_vector);

end

