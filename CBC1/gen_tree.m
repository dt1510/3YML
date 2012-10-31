function [ tree ] = gen_tree( x, y, emotion )
%GEN_TREE Summary of this function goes here
%   Detailed explanation goes here

    attributes = init_attributes();
    binary_targets = set_targets(y, emotion);
    tree = decision_tree_learning(x, attributes, binary_targets);
end

