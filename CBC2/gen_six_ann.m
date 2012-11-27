function [ net ] = gen_six_ann( x, y )
%GEN_SIX_ANN genarates six anns for binary classification.
    net = cell(6, 1);
    [x2, y2] = ANNdata(x, y);
    for i=1:6,
        net{i} = gen_bare_ann();
        [net{i}] = configure(net{i}, x2, y2(i,:));
    end
    
end

