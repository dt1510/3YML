function [stats1] = ANN_main( x, y )
%ANN_main is the main function which takes a matrix x of examples and
%vector y of target values. Invokes all other functions in our ANN
%assignment.

RandStream.setGlobalStream(RandStream('mt19937ar','seed',1)); 
[net1] = gen_one_ann(x,y);
[net6] = gen_six_ann(x,y);
stats1 = get_stats(x, y, net1);
stats6 = get_stats(x, y, net6);
f1_vec1 = stats1.avg_F1_measures_over_classes;
f1_vec6 = stats6.avg_F1_measures_over_classes;
disp(f1_vec1);
disp(f1_vec6);
plot_F1_measures(f1_vec1, f1_vec6);


end

