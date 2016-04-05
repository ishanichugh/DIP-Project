
close all;
clear;
clc;

TargIm      = imread('OL.jpg');

% Get mask for area to be edited out of the image
figure; f = imshow(TargIm);
title 'Select closed polygon area to blend'
h = impoly;
position = wait(h);
MaskTarg = createMask(h,f);
close(gcf)


% Place zeros in the area we wish to edit out
TargImPasteR = double(TargIm(:, :, 1));
TargImPasteG = double(TargIm(:, :, 2));
TargImPasteB = double(TargIm(:, :, 3));

TargImPasteR(logical(MaskTarg(:))) = 0;
TargImPasteG(logical(MaskTarg(:))) = 0;
TargImPasteB(logical(MaskTarg(:))) = 0;

TargImPaste = cat(3, TargImPasteR, TargImPasteG, TargImPasteB);

% Solve Poisson equations in target image wihtihn masked area
TargFilled = PoissonColorImEditor(TargImPaste, MaskTarg);

% Show end results
TargBoundry = bwboundaries(MaskTarg, 8);
figure;
subplot(2, 1, 1)
imshow(TargIm), axis image
hold on
for k = 1:length(TargBoundry)
    boundary = TargBoundry{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1)
end
title('Target Image with intended area to be removed');
subplot(2, 1, 2)
imshow(uint8(TargFilled));
axis image
title('With marked area edited out');

