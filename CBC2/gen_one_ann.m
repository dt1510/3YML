function [ net, tr ] = gen_one_ann(x, y)
%GEN_ONE_ANN generates one ann classifying instances into six classes.
    [x2, y2] = ANNdata(x, y);
    [net] = gen_bare_ann();
    [net] = configure(net, x2, y2);
    [net, tr] = train(net, x2, y2);    
end

