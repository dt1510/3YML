function [ predictions ] = testCBR( cbr, x2 )
%TESTCBR given the input vectors, returns its corresponding target value
%according to the trained cbr.
    predictions = zeros(size(x2, 1), 1);
    for i = 1:size(x2, 1)
        newcase = new_unclassified_case(x2(i, :));
        [similarcase, case_location] = retrieve(cbr, newcase);
        solvedcase = reuse(similarcase, newcase);
        cbr = retain(cbr, solvedcase, case_location);
        predictions(i) = solvedcase.y;
    end
end

