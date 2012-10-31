function tree = decision_tree_learning( examples, attributes, binary_targets )

tree = struct('op',{{}},'kids',{{}},'class',{{}}, 'entropy', {{}});

if sum(binary_targets)==0
    tree.class = 0;
    tree.entropy = 0;
    return
    
elseif sum(binary_targets)==length(binary_targets)
    tree.class = 1;
    tree.entropy = 0;
    return
    
elseif isempty(attributes)
    tree.class = majority_value(binary_targets);
    p = 0;
    n = 0;
    for i = 1:length(binary_targets)
        if binary_targets(i) == 0
            n = n + 1;
        else
            p = p + 1;
        end
    end
    tree.entropy = find_entropy(p, n);
    return
    
else
    best_attribute = choose_best_decision_attribute(examples, attributes, binary_targets);
    tree.op = attributes(best_attribute);
    examples0 = zeros(length(binary_targets),45);
    examples1 = zeros(length(binary_targets),45);
    num_rows0 = 0;
    num_rows1 = 0;
    binary_targets0 = zeros(length(binary_targets));
    binary_targets1 = zeros(length(binary_targets));
    for j = 1:length(binary_targets)
        new_row = examples(j,:);
        if examples(j, attributes(best_attribute)) == 0
            num_rows0 = num_rows0 + 1;
            examples0(num_rows0,:) = new_row;
            binary_targets0(num_rows0) = binary_targets(j);
        else
            num_rows1 = num_rows1 + 1;
            examples1(num_rows1,:) = new_row;
            binary_targets1(num_rows1) = binary_targets(j);   
        end
        examples0 = examples0(1:num_rows0,:);
        examples1 = examples1(1:num_rows1,:);
        binary_targets0 = binary_targets0(1:num_rows0);
        binary_targets1 = binary_targets1(1:num_rows1);
    end
    attributes(best_attribute) = [];
    left_subtree = struct('op',{{}},'kids',{{}},'class',{{}});
    right_subtree = struct('op',{{}},'kids',{{}},'class',{{}});
    if isempty(examples0)
        left_subtree.class =  majority_value(binary_targets);
        left_subtree.op = {};
    else
       % attributes(best_attribute) = [];
        left_subtree = decision_tree_learning(examples0, attributes, binary_targets0);
    end 
    if isempty(examples1)
        right_subtree.class =  majority_value(binary_targets);
        right_subtree.op = {};
    else
       % attributes(best_attribute) = [];
        right_subtree = decision_tree_learning(examples1, attributes, binary_targets1);
    end
    tree.kids = {left_subtree, right_subtree}; 
    return
    
end

    
end

