function [ stats ] = get_stats ( x ,y, net )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    rand_x = x;
    rand_y = y;
    num_classes = 6;
    num_folds = 10;
    
    stats = struct('confusion_matrix',[], 'avg_classification_rate',[], 'avg_recall_rates',[], 'avg_precision_rates',[], 'avg_F1_measures_over_folds',[], 'avg_F1_measures_over_classes',[]); 
    classifier = cell(1,num_folds);
    
    for i = 1:num_folds
        classifier{i} = cross_validate(rand_x,rand_y, i, net);
    end
    
    stats.avg_classification_rate = 0;
    stats.confusion_matrix = zeros(num_classes,num_classes);
    stats.avg_F1_measures_over_classes = zeros(1,num_folds);
    for i = 1:num_folds
        nans = 0;
        stats.confusion_matrix = stats.confusion_matrix + classifier{i}.confusion_matrix;
        stats.avg_classification_rate = stats.avg_classification_rate + classifier{i}.error_rate;
        for j = 1:num_classes
            if classifier{i}.F1_measures(j) == -1
                nans = nans + 1;
            else
                stats.avg_F1_measures_over_classes(i) = stats.avg_F1_measures_over_classes(i) + classifier{i}.F1_measures(j);
            
            %stats.avg_F1_measures_over_classes(i) = stats.avg_F1_measures_over_classes(i) + get_F1_measure(classifier{i}.recall_rates(j), classifier{i}.precision_rates(j));
            end
        end
        stats.avg_F1_measures_over_classes(i) = stats.avg_F1_measures_over_classes(i) / num_classes - nans; 
    end
    stats.confusion_matrix = stats.confusion_matrix / num_folds;
    stats.avg_classification_rate = 1 - stats.avg_classification_rate / num_folds;
    stats.avg_recall_rates = zeros(1,num_classes);
    stats.avg_precision_rates = zeros(1,num_classes);
    stats.avg_F1_measures_over_folds = zeros(1,num_classes);
    for i = 1:num_classes
        nans = zeros(1,3);
        for j = 1:num_folds
            if  classifier{j}.precision_rates(i) == -1
                nans(1) = nans(1) + 1;
            else
                stats.avg_precision_rates(i) = stats.avg_precision_rates(i) + classifier{j}.precision_rates(i);
            end
            if classifier{j}.recall_rates(i) == -1
                nans(2) = nans(2) + 1;
            else
                stats.avg_recall_rates(i) = stats.avg_recall_rates(i) + classifier{j}.recall_rates(i);
            end
            if classifier{j}.F1_measures(i) == -1
                nans(3) = nans(3) + 1;
            else
                stats.avg_F1_measures_over_folds(i) = stats.avg_F1_measures_over_folds(i) + classifier{j}.F1_measures(i);
                %stats.avg_F1_measures_over_folds(i) = stats.avg_F1_measures_over_folds(i) + get_F1_measure(classifier{j}.recall_rates(i), classifier{j}.precision_rates(i));
            end
        end
        stats.avg_precision_rates(i) = stats.avg_precision_rates(i) / (num_folds - nans(1));
        stats.avg_recall_rates(i) = stats.avg_recall_rates(i) / (num_folds - nans(2));
        stats.avg_F1_measures_over_folds(i) = stats.avg_F1_measures_over_folds(i) / (num_folds - nans(3));
    end
    

    
    

end

