function [ stats ] = get_stats ( x ,y)
%GET_STATS is the main function which calls cross_validate.m 10 times

    rand_x = x;
    rand_y = y;
    num_classes = 6;
    num_folds = 10;
    %cbr = CBRinit(x,y);
    stats = struct('confusion_matrix',[], 'avg_classification_rate',[], 'avg_recall_rates',[], 'avg_precision_rates',[], 'avg_F1_measures_over_folds',[]); 
    classifier = cell(1,num_folds);
    for i = 1:num_folds
        classifier{i} = cross_validate(rand_x,rand_y, i);
    end 
    stats.avg_classification_rate = 0;
    stats.confusion_matrix = zeros(num_classes,num_classes);
    for i = 1:num_folds
        stats.confusion_matrix = stats.confusion_matrix + classifier{i}.confusion_matrix;
        stats.avg_classification_rate = stats.avg_classification_rate + classifier{i}.error_rate;
    end
    stats.confusion_matrix = stats.confusion_matrix / num_folds;
    stats.avg_classification_rate = 1 - (stats.avg_classification_rate / num_folds);
    stats.avg_recall_rates = zeros(1,num_classes);
    stats.avg_precision_rates = zeros(1,num_classes);
    stats.avg_F1_measures_over_folds = zeros(1,num_classes);
    for i = 1:num_classes
        for j = 1:num_folds
            stats.avg_precision_rates(i) = stats.avg_precision_rates(i) + classifier{j}.precision_rates(i);
            stats.avg_recall_rates(i) = stats.avg_recall_rates(i) + classifier{j}.recall_rates(i);
            stats.avg_F1_measures_over_folds(i) = stats.avg_F1_measures_over_folds(i) + classifier{j}.F1_measures(i);
        end
        stats.avg_precision_rates(i) = stats.avg_precision_rates(i) / num_folds;
        stats.avg_recall_rates(i) = stats.avg_recall_rates(i) / num_folds;
        stats.avg_F1_measures_over_folds(i) = stats.avg_F1_measures_over_folds(i) / num_folds;
    end

end

