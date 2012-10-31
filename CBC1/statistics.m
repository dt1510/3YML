function [ confusion_matrix, avg_classification_rate, avg_recall_rates, avg_precision_rates, avg_F1_measures ] = statistics( examples, target_vector )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    num_classes = 6;
    num_folds = 10;
  
    classifier = struct('predictions',{{}},'confusion_matrix',{{}},'error_rate',{{}},'precision_rates',{{}}, 'recall_rates',{{}},'F1_measures',{{}});
    classifier.confusion_matrix = zeros(num_classes,num_classes);
    classifier.precision_rates = zeros(1,num_classes);
    classifier.recall_rates = zeros(1,num_classes);
    classifier.F1_measures = zeros(1,num_classes);
    
    randomise_rows(examples);
    for i = 1:num_folds
        [predictions, test_vector] = cross_validate(examples, target_vector, i);
        classifier(i).predictions = predictions;
        classifier(i).confusion_matrix = get_confusion_matrix(num_classes, test_vector, classifier(i).predictions);
        classifier(i).error_rate = get_error_rate(test_vector, classifier(i).predictions);
        for j = 1:num_classes
            classifier(i).precision_rates(j) = get_precision_rate(j, classifier(i).confusion_matrix);
            classifier(i).recall_rates(j) = get_recall_rate(j, classifier(i).confusion_matrix);
            classifier(i).F1_measures(j) = get_F1_measure(classifier(i).recall_rates(j), classifier(i).precision_rates(j));
        end        
    end
    
    confusion_matrix = zeros(num_classes,num_classes);
    for i = 1:num_folds
        confusion_matrix = confusion_matrix + classifier(i).confusion_matrix;
    end
    confusion_matrix = confusion_matrix / num_folds;
    avg_classification_rate = 1 - sum([classifier.error_rate])/num_folds;
    avg_recall_rates = zeros(1,num_classes);
    avg_precision_rates = zeros(1,num_classes);
    avg_F1_measures = zeros(1,num_classes);
    for i = 1:num_classes
        for j = 1:num_folds
            avg_precision_rates(i) = avg_precision_rates(i) + classifier(j).precision_rates(i);
            avg_recall_rates(i) = avg_recall_rates(i) + classifier(j).recall_rates(i);
            avg_F1_measures(i) = avg_F1_measures(i) + classifier(j).F1_measures(i);
        end
        avg_precision_rates(i) = avg_precision_rates(i) / num_folds;
        avg_recall_rates(i) = avg_recall_rates(i) / num_folds;
        avg_F1_measures(i) = avg_F1_measures(i) / num_folds;
    end

end

