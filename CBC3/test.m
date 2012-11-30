function [ classification_rate ] = test( x, y, use_percentage, similarity_function)
%TEST tests a classification rate of the current CBR implementation.
%A user can specify the percentage of data, the tests should be performed
%with.
    if nargin == 2
        use_percentage = 1;
    end    
    if nargin <= 3
        similarity_function = 'similarity';
    end
    
    training_ratio = 0.67;
    total_size = ceil(length(y)*use_percentage);
    training_size = floor(total_size*training_ratio);    
    x_train = x(1:training_size, :);
    y_train = y(1:training_size);
    
    x_test = x(training_size+1:total_size, :);
    y_test = y(training_size+1:total_size);
    
    cbr = CBRinit(x_train, y_train, similarity_function);
    y_guess = testCBR(cbr, x_test);
    
    classification_rate = (total_size-nnz(y_guess - y_test))/total_size;
    %cbr.active_count
    %cbr.class_weights
end

