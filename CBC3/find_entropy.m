function entropy = find_entropy(p, n)
% Calculates the entropy based on the number of positive and the number of
% negative cases
    if(p==0 || n==0)
        entropy = 0;
    else
        entropy = -(p/(p+n))*log2(p/(p+n)) - (n/(p+n))*log2(n/(p+n));
    end
end

