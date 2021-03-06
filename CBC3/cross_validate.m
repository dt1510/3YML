function [ info, error_rates ] = cross_validate( x, y, fold_number, similarity_function)
%CROSS_VALIDATE performs one fold of the cross validation, according to the
%current fold number. Stores the cross-validation results of the current
%fold in struct 'info'

    num_classes = 6;
    info = struct('predictions',[],'confusion_matrix',[],'error_rate',[],'precision_rates',[],'recall_rates',[],'F1_measures',[],'classif_errors',[]);
    info.precision_rates = zeros(1,num_classes);
    info.recall_rates = zeros(1,num_classes);
    info.F1_measures = zeros(1,num_classes);
    data = split_data(x, y, fold_number);
    cbr = CBRinit(data.train_examples,data.train_targets, similarity_function);
    info.predictions = testCBR(cbr,data.test_examples);
    info.confusion_matrix = get_confusion_matrix(num_classes, data.test_targets, info.predictions);
   % disp(info.confusion_matrix);
    info.error_rate = get_error_rate(data.test_targets, info.predictions);
    for i = 1:num_classes
        info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
        info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
        info.F1_measures(i) = get_F1_measure(info.recall_rates(i), info.precision_rates(i));
    end
 %   info.classif_errors = zeros(1,num_classes);
    %matrix
 %   temp_vec1 = zeros(size(data.test_targets,1),num_classes);
 %   temp_vec1 = zeros(size(data.test_targets,1),num_classes);
   % for i = 1:num_classes
   %     temp_vec(:,i) = zeros(size(data.test_targets,1),1);
   % end
 %  for i = num_classes
 %       for j = 1:size(data.test_targets,1)
 %           if data.test_targets(j) ==
               
 %           end
 %       end
 %   end
 %   for i = 1:num_classes
 %       for j = 1:size(data.test_targets,1)
 %           error = 0;
 %           if info.predictions(j) == i && data.testdata.test_targets(j);
 %               error = 1;
 %          end
 %           num_errors = num_errors + error;  
 %       end
 %       info.classif_errors(i) = num_errors / size(data.test_targets,1); 
 %   end
    
   
        
    error_rates = zeros(6, 1);
    len = size(data.test_targets, 1);    
    bin_targets = zeros(len);
    bin_predictions = zeros(len);
    for emotion=1:6
        for i=1:len
            bin_targets(i) = data.test_targets(i) == emotion;
            bin_predictions(i) = info.predictions(i) == emotion;
        end       
        
        error_rate = nnz(bin_targets - bin_predictions)/len;        
        error_rates(emotion)=error_rate;
    end 
    
    

end

