function [ anns ] = gen_anns()
%generates an untrained ann.

    training_functions = {'trainlm','traingd'};
    activation_functions = {'tansig', 'purelin'};
    neurons = [10, 100];
    hidden_layers = [1, 2];
    anns = cell(size(training_functions,2)*size(neurons,2)*size(hidden_layers,2)*size(activation_functions,2), 1);
    i=0;
    for i1=1:1:size(training_functions,2)
        for i2=1:1:size(neurons,2)
            for i3=1:1:size(hidden_layers,2)
                for i4=1:1:size(activation_functions,2)
                    i = i + 1;
                    layers_vector = neurons(i2)*ones(1, hidden_layers(i3));
                    [net] = feedforwardnet(layers_vector,training_functions{i1});
                    for j1=1:hidden_layers(i3)
                        net.layers{j1}.transferFcn = activation_functions{i4};
                    end             
                    anns{i} = net;
                end
            end
        end
    end
end

