function [ tree ] = gen_tree( x, y, emotion )
% Generates a binary decision tree, taking inputs: matrix x of the example
% set, vector y containing the emotion labels for each of the examples, and
% the specific emotion we wish to find the binary tree for. This tree can
% then be drawn using the DrawDecisionTree function.

    attributes = init_attributes();
    binary_targets = set_targets(y, emotion);
    tree = decision_tree_learning(x, attributes, binary_targets);
end

