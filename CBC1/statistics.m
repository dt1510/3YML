function [ stats ] = statistics( examples, target_vector )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    stats = struct('confusion_matrix',{{}}, 'avg_classification_rate',{{}}, 'avg_recall_rates',{{}}, 'avg_precision_rates',{{}}, 'avg_F1_measures',{{}}); 

    num_classes = 6;
    num_folds = 10;
  
    classifier = struct('predictions',{{}},'confusion_matrix',{{}},'error_rate',{{}},'precision_rates',{{}}, 'recall_rates',{{}},'F1_measures',{{}});
    %classifier.confusion_matrix = zeros(num_classes,num_classes);
    %classifier.precision_rates = zeros(1,num_classes);
    %classifier.recall_rates = zeros(1,num_classes);
    %classifier.F1_measures = zeros(1,num_classes);
    
    randomise_rows(examples);
    for i = 1:num_folds
        info = cross_validate(examples, target_vector, i);
        classifier(i).predictions = info.predictions;
        classifier(i).confusion_matrix = info.confusion_matrix;  %get_confusion_matrix(num_classes, test_vector, classifier(i).predictions);
        classifier(i).error_rate = info.error_rate; %get_error_rate(test_vector, classifier(i).predictions);
        for j = 1:num_classes
            classifier(i).precision_rates = info.precision_rates;  %get_precision_rate(j, classifier(i).confusion_matrix);
            classifier(i).recall_rates = info.recall_rates; %get_recall_rate(j, classifier(i).confusion_matrix);
            classifier(i).F1_measures = info.F1_measures; %get_F1_measure(classifier(i).recall_rates(j), classifier(i).precision_rates(j));
        end        
    end
    
    stats.confusion_matrix = zeros(num_classes,num_classes);
    for i = 1:num_folds
        stats.confusion_matrix = stats.confusion_matrix + classifier(i).confusion_matrix;
    end
    stats.confusion_matrix = stats.confusion_matrix / num_folds;
    stats.avg_classification_rate = 1 - sum([classifier.error_rate])/num_folds;
    stats.avg_recall_rates = zeros(1,num_classes);
    stats.avg_precision_rates = zeros(1,num_classes);
    stats.avg_F1_measures = zeros(1,num_classes);
    for i = 1:num_classes
        for j = 1:num_folds
            stats.avg_precision_rates(i) = stats.avg_precision_rates(i) + classifier(j).precision_rates(i);
            stats.avg_recall_rates(i) = stats.avg_recall_rates(i) + classifier(j).recall_rates(i);
            stats.avg_F1_measures(i) = stats.avg_F1_measures(i) + classifier(j).F1_measures(i);
        end
        stats.avg_precision_rates(i) = stats.avg_precision_rates(i) / num_folds;
        stats.avg_recall_rates(i) = stats.avg_recall_rates(i) / num_folds;
        stats.avg_F1_measures(i) = stats.avg_F1_measures(i) / num_folds;
    end

end

