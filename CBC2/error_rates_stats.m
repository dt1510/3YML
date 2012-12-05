function [ ers ] = error_rates_stats( x, y, net )
%ERROR_RATES_STATS Summary of this function goes here
%   Detailed explanation goes here
    num = 10;
    error_rates = cell(num, 1);
    for fold_number = 1:num
        [~, error_rates{fold_number}] = cross_validate(x, y, fold_number, net);
    end
    
    ers = cell(num, 1);
    for fold_number = 1:num
        ers{fold_number} = zeros(6, 1);
        for i=1:num
            if(not(fold_number == i))                
                ers{fold_number} = ers{fold_number} + error_rates{i};
            end
        end
    end        
end

