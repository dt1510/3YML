function [ solvedcase ] = reuse( bestcase, newcase )
%REUSE takes as input bestcase (the best-matching case previously returned
%by retrieve) and newcase (the new case presented to the CBR system). It
%attaches the solution of bestcase to newcase, resulting in solvedcase.

newcase.y = bestcase.y;
solvedcase = newcase;

end