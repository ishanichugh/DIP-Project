function neighbors = calcAdjancency( Mask )

NUM_OF_NEIGHBORS = 4;
[height, width]      = size(Mask);


[row_mask, col_mask] = find(Mask);

neighbors = zeros(length(row_mask), length(row_mask));


roi_idxs = sub2ind([height, width], row_mask, col_mask);

for k = 1:size(row_mask, 1),
   
    connected_4 = [row_mask(k), col_mask(k)-1;%left
                   row_mask(k), col_mask(k)+1;%right
                   row_mask(k)-1, col_mask(k);%top
                   row_mask(k)+1, col_mask(k)];%bottom

    ind_neighbors = sub2ind([height, width], connected_4(:, 1), connected_4(:, 2));
    
    for neighbor_idx = 1:NUM_OF_NEIGHBORS,
        adjacent_pixel_idx = binaraysearchasc(roi_idxs, ind_neighbors(neighbor_idx));
        neighbors(k, adjacent_pixel_idx) = 1;
    end
    
end


end



function index = binaraysearchasc(x,sval)

index=[];
from=1;
to=length(x);

while from<=to
    mid = round((from + to)/2);    
    diff = x(mid)-sval;
    if diff==0
        index=mid;
        return
    elseif diff<0   
        from=mid+1;
    else              
        to=mid-1;			
    end
end
end
