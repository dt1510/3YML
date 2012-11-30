function [ cbr ] = CBRinit( x, y, similarity_function )
%CBRINIT generates a case struct and trains it with the data provided.
    if nargin == 2
        similarity_function = 'similarity';
    end
    
    cbr = new_case_struct(similarity_function);
    for i = 1:length(y)
            single_case = new_case(x(i, :), y(i));
            cbr = add_case(cbr, single_case);
    end
    
    cbr = compute_weights(cbr);
    cbr = compute_means(cbr);
    
end

