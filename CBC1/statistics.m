function [ stats ] = statistics( examples, target_vector )
%Performs cross validation and statistics for every fold.

    stats = struct('confusion_matrix',[], 'avg_classification_rate',[], 'avg_recall_rates',[], 'avg_precision_rates',[], 'avg_F1_measures',[]); 
    classifier = struct('predictions',[],'confusion_matrix',[],'error_rate',[],'precision_rates',[], 'recall_rates',[],'F1_measures',[]);
    num_classes = 6;
    num_folds = 10;
    
    [randomised_examples, randomised_targets] = randomise_rows(examples, target_vector);
    for i = 1:num_folds
        info = cross_validate(randomised_examples,randomised_targets, i);
        classifier(i).predictions = info.predictions;
        classifier(i).confusion_matrix = info.confusion_matrix;  
        classifier(i).error_rate = info.error_rate; 
        for j = 1:num_classes
            classifier(i).precision_rates = info.precision_rates; 
            classifier(i).recall_rates = info.recall_rates;
            classifier(i).F1_measures = info.F1_measures;
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

