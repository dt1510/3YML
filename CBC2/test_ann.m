
function [ classification_rate, classification_rate6 ] = test_ann( x, y, options )
%Computes a classification rate.
    [x2, y2] = ANNdata(x, y);
    net = gen_one_ann(x, y);
    predictions = testANN(net,x2);
    classification_rate = (size(y,1) - nnz(predictions - y))/size(y, 1);
    classification_rate6 = 0;
    if(options == 6),
        net6 = gen_six_ann(x, y);
        predictions6 = testANN(net6,x2);
        classification_rate6 = (size(y,1) - nnz(predictions6 - y))/size(y, 1);
    end
    
    
end

