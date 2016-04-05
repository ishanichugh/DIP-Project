function [MaskTarg, TargImPaste] = paste_source_into_targ(SourceIm, TargIm, SourceMask, shift_in_target_image)


[TargImRows, TargImCols, ~] = size(TargIm);
MaskTarg = calc_mask_in_targ_image(SourceMask, TargImRows, TargImCols, shift_in_target_image);


TargImPasteR = double(TargIm(:, :, 1));
TargImPasteG = double(TargIm(:, :, 2));
TargImPasteB = double(TargIm(:, :, 3));

h = [0 -1 0; -1 4 -1; 0 -1 0];
LaplacianSource = imfilter(double(SourceIm), h, 'replicate');
figure;
imshow(LaplacianSource),title('mask_test');
VR = LaplacianSource(:, :, 1);
VG = LaplacianSource(:, :, 2);
VB = LaplacianSource(:, :, 3);
TargImPasteR(logical(MaskTarg(:))) = VR(SourceMask(:));
TargImPasteG(logical(MaskTarg(:))) = VG(SourceMask(:));
TargImPasteB(logical(MaskTarg(:))) = VB(SourceMask(:));

TargImPaste = cat(3, TargImPasteR, TargImPasteG, TargImPasteB);
