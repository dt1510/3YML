function [ net ] = simple_test_ann( x, y )
%SIMPLE_TEST_ANN
    [x2, y2] = ANNdata(x,y);
    net = feedforwardnet([40, 40],'trainlm');
    net.layers{1}.transferFcn = 'tansig';    
    configure(net, x2, y2);
    net.divideParam.trainRatio = 67/100;
    net.divideParam.valRatio = 33/100;
    net.divideParam.testRatio = 0;
    [net, tr] = train(net, x2, y2);
end

