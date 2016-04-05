
function [gaussout] = gauss_pyramid(im, levels)
    gaussout = cell(1,levels+1);
    gaussout{1} = im;
    subsample = im;
    for i = 2 : levels+1
        subsample = reduce(subsample);
        gaussout{i} = subsample;
    end
end
