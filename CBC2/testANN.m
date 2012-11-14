function [ predictions ] = testANN( net, x2 )

[t] = sim(net, x2);
predictions = NNout2labels(t);


end

