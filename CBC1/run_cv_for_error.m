function [ error_rates ] = run_cv_for_error( x, y )
% Performs 10-fold cross validation to get the error rates per fold per
% emotion


error_rates = struct('per_fold',[]);
for i = 1:10
        [~, error_rates(i).per_fold] = cross_validate(x, y, i);
end

end

