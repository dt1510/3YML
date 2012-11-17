function [ stats ] = get_stats ( x ,y, net )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    rand_x = x;
    rand_y = y;
    info = cell(1,6);
    num_classes = 6;
    num_folds = 10;
    
    for i = 1:num_folds
        info{i} = cross_validate(rand_x, rand_y, i, net);
    end
    
    stats = struct('confusion_matrix',[], 'avg_classification_rate',[], 'avg_recall_rates',[], 'avg_precision_rates',[], 'avg_F1_measures',[]); 
    classifier = cell(1,num_folds);
    
    for i = 1:num_folds
        info = cross_validate(rand_x,rand_y, i, net);
        classifier{i} = info;
    end
    
    stats.confusion_matrix = zeros(num_classes,num_classes);
    for i = 1:num_folds
        stats.confusion_matrix = stats.confusion_matrix + classifier{i}.confusion_matrix;
        stats.avg_classification_rate = stats.avg_classification_rate + classifier{i}.error_rate;
        %stats.avg_F1_measures_over_classes;
    end
    stats.confusion_matrix = stats.confusion_matrix / num_folds;
    stats.avg_classification_rate = stats.avg_classification_rate / num_folds;
    
    %stats.avg_classification_rate = 1 - sum([classifier.error_rate])/num_folds;
    stats.avg_recall_rates = zeros(1,num_classes);
    stats.avg_precision_rates = zeros(1,num_classes);
    stats.avg_F1_measures = zeros(1,num_classes);
    for i = 1:num_classes
        for j = 1:num_folds
            stats.avg_precision_rates(i) = stats.avg_precision_rates(i) + classifier{j}.precision_rates(i);
            stats.avg_recall_rates(i) = stats.avg_recall_rates(i) + classifier{j}.recall_rates(i);
            stats.avg_F1_measures(i) = stats.avg_F1_measures(i) + classifier{j}.F1_measures(i);
        end
        stats.avg_precision_rates(i) = stats.avg_precision_rates(i) / num_folds;
        stats.avg_recall_rates(i) = stats.avg_recall_rates(i) / num_folds;
        stats.avg_F1_measures(i) = stats.avg_F1_measures(i) / num_folds;
    end
    

    
    

end

