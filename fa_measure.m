%playing with precision and recall rate. Do not use this in our CBC.
size = 100;
fa = zeros(size, size);
for p = 0:1:size
    for r = 0:1:size
        alpha = -0.51;
        precision = p/size;
        recall = r/size;
        fa(p+1, r+1) = (1+alpha)*recall*precision/(recall*alpha+precision);        
    end
end

 fa

 imagesc(fa);
 axis image;
 colormap(jet(2));
 colorbar;