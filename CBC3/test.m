function [ classification_rate ] = test( x, y )
%TEST tests a classification rate of the current CBR implementation.
    training_ratio = 0.67;
    total_size = length(y);
    training_size = floor(total_size*training_ratio);    
    x_train = x(1:training_size, :);
    y_train = y(1:training_size);
    
    x_test = x(training_size+1:total_size, :);
    y_test = y(training_size+1:total_size);
    
    cbr = CBRinit(x_train, y_train);
    y_guess = testCBR(cbr, x_test);
    
    classification_rate = (total_size-nnz(y_guess - y_test))/total_size;
    
end

