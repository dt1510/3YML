function entropy = find_entropy_from_btargets(binary_targets)
% Calculates the entropy based on the number of positive and the number of
% negative cases
p = 0;
n = 0;
for i = 1:length(binary_targets)
    if binary_targets(i) == 0
        n = n + 1;
    else
        p = p + 1;
    end
end
entropy = find_entropy(p, n);

end

