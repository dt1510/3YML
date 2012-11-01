function tree = decision_tree_learning( examples, attributes, binary_targets )
    tree = struct('op',{{}},'kids',{{}},'class',{{}}, 'entropy', {{}}, 'size', {{}});
    tree.entropy = find_entropy_from_btargets(binary_targets);
    tree.size = length(binary_targets);

    if sum(binary_targets)==0
        tree.class = 0;
        return
    end
    if sum(binary_targets)==length(binary_targets)
        tree.class = 1;
        return
    end
    if isempty(attributes)
        tree.class = majority_value(binary_targets);
        return
    end

    best_attribute = choose_best_decision_attribute(examples, attributes, binary_targets);
    tree.op = attributes(best_attribute);
    tree.entropy = find_entropy_from_btargets(binary_targets);  % entropy field for each internal node
    branch_examples = cell(1,2);
    branch_bts = cell(1,2);
    num_rows = [0,0];
    for i = 1:2
        branch_bts{i} = zeros(length(binary_targets)); 
        branch_examples{i} = zeros(length(binary_targets),size(examples,2));
    end
  
    for j = 1:length(binary_targets)
            
        new_row = examples(j,:);
        if examples(j, attributes(best_attribute)) == 0
            num_rows(1) = num_rows(1) + 1;
            branch_examples{1}(num_rows(1),:) = new_row;
            branch_bts{1}(num_rows(1)) = binary_targets(j);
        else
            num_rows(2) = num_rows(2) + 1;
            branch_examples{2}(num_rows(2),:) = new_row;
            branch_bts{2}(num_rows(2)) = binary_targets(j);   
        end
   end 
            
   for k = 1:2
        branch_examples{k} = branch_examples{k}(1:num_rows(k),:);
        branch_bts{k} = branch_bts{k}(1:num_rows(k));
   end
   
    attributes(best_attribute) = [];
    subtrees = cell(1,2);
    for i = 1:2
        subtrees{i} = struct('op',{{}},'kids',{{}},'class',{{}},'entropy', {{}},'size',{{}});
        if isempty(branch_examples{i})
            subtrees{i}.class =  majority_value(binary_targets);
            subtrees{i}.entropy = find_entropy_from_btargets(binary_targets);
            subtrees{i}.size = length(binary_targets);
        else
            subtrees{i} = decision_tree_learning(branch_examples{i}, attributes, branch_bts{i}); 
        end
        tree.kids{i} = subtrees{i};
    end

    
end

