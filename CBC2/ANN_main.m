function [ ] = ANN_main( x, y )
%ANN_main is the main function which takes a matrix x of examples and
%vector y of target values. Invokes all other functions in our ANN
%assignment.

%[x2, y2] = ANNdata(x,y);
[net1] = gen_one_ann(x,y);     % tr ever used??
[net6] = gen_six_ann(x,y);
stats1 = get_stats(x, y, net1);
stats6 = get_stats(x, y, net6);
f1_vec1 = stats1.avg_F1_measures_over_classes;
f1_vec6 = stats6.avg_F1_measures_over_classes;
plot_F1_measures(f1_vec1, f1_vec6);


end
