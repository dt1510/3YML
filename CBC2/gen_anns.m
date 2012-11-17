function [ net ] = gen_anns()
%generates an untrained ann.

    activation_functions = ['trainlm'];
    neurons = [5, 10, 20, 50, 100];
    hidden_layers = [1, 2, 3];
    net = zeros[size(activation_functions)];
    i=1;
    for i1=1:1:size(activation_functions)
        for i2=1:1:size(neurons)
            for i3=1:1:size(hidden_layers)
                layers_vector = neurons(i2)*ones(1, hidden_layers(i3));                
                [net] = feedforwardnet(layers_vector,activation_functions(i1));
            end
        end
    end

end

