function [ net, best_val_perf ] = simple_test_ann( x, y )
%SIMPLE_TEST_ANN
    RandStream.setGlobalStream(RandStream('mt19937ar','seed',1)); 
    [x2, y2] = ANNdata(x,y);
    net = feedforwardnet([10],'trainlm');
    net.layers{1}.transferFcn = 'tansig';
    configure(net, x2, y2);
    net.divideFcn = 'divideint';    
    net.divideParam.trainRatio = 67/100;
    net.divideParam.valRatio = 33/100;    
    net.divideParam.testRatio = 0;
    [net, tr] = train(net, x2, y2);
    best_val_perf = tr.best_vperf;
end

