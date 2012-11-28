function [ classification_rate ] = test( x, y )
%TEST for testing and debugging purposes.
    size = 500;
    x_train = x(1:size, :);
    y_train = y(1:size);
    
    x_test = x(size+1:size*2, :);
    y_test = y(size+1:size*2);
    
    cbr = CBRinit(x_train, y_train);
    y_guess = testCBR(cbr, x_test);
    
    classification_rate = (size-nnz(y_guess - y_test))/size;
    
end

