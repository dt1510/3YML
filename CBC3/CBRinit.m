function [ cbr ] = CBRinit( x, y )
%CBRINIT generates a case struct and trains it with the data provided.
    cbr = new_case_struct();
    for i = 1:length(y)
            single_case = new_case(x(i, :), y(i));
            cbr = add_case(cbr, single_case);
    end
end

