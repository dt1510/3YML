function mode = majority_value(b_targets)
% returns the mode of the b_targets

if sum(b_targets) >= length(b_targets)/2
    mode = 1;
else
    mode = 0;
end

end