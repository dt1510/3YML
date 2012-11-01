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
    tree.entropy = find_entropy_from_btargets(binary_targets);
    return
    
else
    best_attribute = choose_best_decision_attribute(examples, attributes, binary_targets);
    tree.op = attributes(best_attribute);
    branch_examples = cell(1,2);
    branch_bts = cell(1,2);
    num_rows = [0,0];
    for i = 1:2
        branch_bts{i} = zeros(length(binary_targets)); 
        branch_examples{i} = zeros(length(binary_targets),45);
    end
   % binary_targets{1} = zeros(length(binary_targets));   
   % binary_targets{2} = zeros(length(binary_targets)); 
   % examples{1} = zeros(length(binary_targets),45);
   % examples{2} = zeros(length(binary_targets),45);
   % examples0 = zeros(length(binary_targets),45);
   % examples1 = zeros(length(binary_targets),45);
   % num_rows0 = 0;
   % num_rows1 = 0;
   % binary_targets0 = zeros(length(binary_targets));
   % binary_targets1 = zeros(length(binary_targets));
    
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
    
%    for j = 1:length(binary_targets)
%       new_row = examples(j,:);
%        if examples(j, attributes(best_attribute)) == 0
%            num_rows0 = num_rows0 + 1;
%            examples0(num_rows0,:) = new_row;
%            binary_targets0(num_rows0) = binary_targets(j);
%        else
%            num_rows1 = num_rows1 + 1;
%            examples1(num_rows1,:) = new_row;
%            binary_targets1(num_rows1) = binary_targets(j);   
%        end
%        examples0 = examples0(1:num_rows0,:);
%        examples1 = examples1(1:num_rows1,:);
%        binary_targets0 = binary_targets0(1:num_rows0);
%        binary_targets1 = binary_targets1(1:num_rows1);
%    end 
    
   
    attributes(best_attribute) = [];
%    left_subtree = struct('op',{{}},'kids',{{}},'class',{{}},'entropy', {{}});
%    right_subtree = struct('op',{{}},'kids',{{}},'class',{{}}, 'entropy', {{}});
    subtrees = cell(1,2);
    for i = 1:2
        subtrees{i} = struct('op',{{}},'kids',{{}},'class',{{}},'entropy', {{}});
        if isempty(branch_examples{i})
            subtrees{i}.class =  majority_value(binary_targets);
            subtrees{i}.entropy = find_entropy_from_btargets(binary_targets);
        else
            subtrees{i} = decision_tree_learning(branch_examples{i}, attributes, branch_bts{i}); 
        end
        tree.kids{i} = subtrees{i};
    end
%    if isempty(examples0)
%        left_subtree.class =  majority_value(binary_targets);
%        left_subtree.entropy = find_entropy_from_btargets(binary_targets);
%    else
%        left_subtree = decision_tree_learning(examples0, attributes, binary_targets0);
%    end 
%    if isempty(examples1)
%        right_subtree.class =  majority_value(binary_targets);
%        right_subtree.entropy = find_entropy_from_btargets(binary_targets);
%    else
%        right_subtree = decision_tree_learning(examples1, attributes, binary_targets1);
%    end
%   tree.kids = {left_subtree, right_subtree}; 
    
end

    
end

