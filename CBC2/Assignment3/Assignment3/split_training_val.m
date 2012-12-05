function [ net ] = split_training_val( net )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    net.divideParam.trainRatio = 67/100;
    net.divideParam.valRatio = 33/100;

end

