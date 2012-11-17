function [ anns ] = gen_anns()
%generates an untrained ann.

    activation_functions = {'trainlm'};
    neurons = [5, 10];    
    hidden_layers = [1, 2];
    anns = cell(size(activation_functions,2)*size(neurons,2)*size(hidden_layers,2), 1);
    i=0;
    for i1=1:1:size(activation_functions,2)        
        for i2=1:1:size(neurons,2)
            for i3=1:1:size(hidden_layers,2)                
                i = i + 1;
                layers_vector = neurons(i2)*ones(1, hidden_layers(i3));
                [net] = feedforwardnet(layers_vector,activation_functions{i1});
                anns{i} = net;
            end
        end
    end
end

