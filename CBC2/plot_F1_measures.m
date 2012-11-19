function [ ] = plot_F1_measures( f1_vector1, f1_vector6 )
% plot_F1_measures takes two 1x10 vectors as arguments. These store the
% average F1 measures over all 6 classes obtained in each fold of the cross
% validation. The vectors are obtained in get_stats.

   % x = 1:10;
   % bar(x,y);
    
y = [f1_vector1', f1_vector6'];
bar(y, 'grouped');
title('Average F1 Measures Per Fold');
xlabel('Fold number');
ylabel('Avg F1 Measure Over All 6 Emotions');
legend('6-output network', '6 single-output networks');


end

