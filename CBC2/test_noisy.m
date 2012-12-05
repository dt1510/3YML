function [ F1_vec ] = test_noisy( x, y, net )
% Takes the noisy data as x and y

num_classes = 6;
info = struct('predictions',[],'confusion_matrix',[],'precision_rates',[],'recall_rates',[],'F1_measures',[]);
info.precision_rates = zeros(1,num_classes);
info.recall_rates = zeros(1,num_classes);
info.F1_measures = zeros(1,num_classes);

[x2, y2] = ANNdata(x, y);
info.predictions = testANN(net,x2);
info.confusion_matrix = get_confusion_matrix(num_classes, y, info.predictions);

for i = 1:num_classes
  info.precision_rates(i) = get_precision_rate(i, info.confusion_matrix);
  info.recall_rates(i) = get_recall_rate(i, info.confusion_matrix);
  info.F1_measures(i) = get_F1_measure(info.recall_rates(i), info.precision_rates(i));
end

F1_vec = info.F1_measures;

end

