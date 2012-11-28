function [ cbr ] = retain( cbr, solvedcase)
%RETAIN adds the solvedcase to the memory.
    cbr = add_case(cbr, solvedcase)
end
