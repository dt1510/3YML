function [ net ] = gen_one_ann(x, y)
%GEN_ONE_ANN generates one ann classifying instances into six classes.
    [x2, y2] = ANNdata(x, y);
    [net] = gen_bare_ann();
    [net] = configure(net, x2, y2);
%     net.divideFcn = 'divideint';
%     net.divideParam.trainRatio = 67/100;
%     net.divideParam.valRatio = 33/100;
%     net.divideParam.testRatio = 0/100;
%     [net] = train(net, x2, y2);
end

