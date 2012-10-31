function [ t ] = test()    
    t = 1;
    
    for i=1:10
        t = i;
        if(t>5)
            return
    end    

end