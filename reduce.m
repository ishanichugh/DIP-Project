function [redout] = reduce(im)
   
    ker = generating_kernel(0.4);
   
    img_blur = imfilter(im, ker, 'conv');
  
    rows = size(im,1);
    cols = size(im,2);
   
    img_blur_rows = img_blur(1:2:rows,:,:);
    
    redout = img_blur_rows(:,1:2:cols,:);
end
