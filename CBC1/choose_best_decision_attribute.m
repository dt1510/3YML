function attribute = choose_best_decision_attribute( examples, attributes, binary_targets )
% chooses the best attribute that results in the highest information gain

%attribute = attributes(1);

p0 = 0;
n0 = 0;
p1 = 0;
n1 = 0;
information_gain = zeros(1,length(attributes));

    function entropy = find_entropy(p, n)
        if(p==0)
            entropy = 0;
        else
            entropy = -(p/(p+n))*log2(p/(p+n)) - (n/(p+n))*log2(n/(p+n));
        end
    end

    function remainder = find_remainder(p0, n0, p1, n1)
        p = p0 + p1;
        n = n0 + n1;
        remainder = ((p0+n0)/(p+n))*find_entropy(p0, n0) +  ((p1+n1)/(p+n))*find_entropy(p1, n1);
    end

for i = 1:length(attributes)
    for j = 1:length(binary_targets)
        if examples(j, attributes(i)) == 0
            if binary_targets(j) == 0
                n0 = n0 + 1;
            else
                p0 = p0 + 1;
            end
        end
        if examples(j, attributes(i)) == 1
            if binary_targets(j) == 0
                n1 = n1 + 1;
            else
                p1 = p1 + 1;
            end
        end
    end
    p = p0 + p1;
    n = n0 + n1;
    information_gain(i) = find_entropy(p, n) - find_remainder(p0, n0, p1, n1);    
end

attribute = find(information_gain==max(information_gain), 1);   % finds the index of vector information_gain which has max value
%attribute = attributes(index);

return

end

