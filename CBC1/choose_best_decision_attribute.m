function [attribute] = choose_best_decision_attribute( examples, attributes, binary_targets )
% Chooses the best attribute that results in the highest information gain.
% Returns "attribute", the index of attributes vector that corresponds to
% the attribute with highest information gain.

p0 = 0;
n0 = 0;
p1 = 0;
n1 = 0;
information_gain = zeros(1,length(attributes));

    function remainder = find_remainder(p0, n0, p1, n1)
        pos = p0 + p1;
        neg = n0 + n1;
        remainder = ((p0+n0)/(pos+neg))*find_entropy(p0, n0) +  ((p1+n1)/(pos+neg))*find_entropy(p1, n1);
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

% finds the index of vector information_gain which has max value
attribute = find(information_gain==max(information_gain), 1);

return

end

