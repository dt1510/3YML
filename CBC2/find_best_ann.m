function [ anns ] = find_best_ann( x, y )
%generates anns and them ordered by their performance starting with the best ann.
%returns a row in a format (network, performance, original order).
    nets = gen_anns();    
    anns = cell(size(nets, 1), 3);    
    ord = ones(size(nets, 1), 1);
    for i=1:1:size(nets)        
        anns{i,1} = nets{i};
        ord(i) = get_performance(x, y, nets{i});                
    end
    %sort anns according to their performance
    [ord2, idx] = sort(ord, 'descend');
    for i=1:1:size(nets)
        anns{i,2} = ord2(i);
        anns{i,3} = idx(i);
    end
end

