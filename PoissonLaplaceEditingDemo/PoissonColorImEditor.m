function TargFilled = PoissonColorImEditor(TargImPaste, MaskTarg)

TargImPasteR = TargImPaste(:, :, 1);
TargImPasteG = TargImPaste(:, :, 2);
TargImPasteB = TargImPaste(:, :, 3);

AdjacencyMat = calcAdjancency( MaskTarg );
TargBoundry  = bwboundaries( MaskTarg, 8);

TargFilledR = PoissonGrayImEditor(TargImPasteR, MaskTarg, AdjacencyMat, TargBoundry);
TargFilledG = PoissonGrayImEditor(TargImPasteG, MaskTarg, AdjacencyMat, TargBoundry);
TargFilledB = PoissonGrayImEditor(TargImPasteB, MaskTarg, AdjacencyMat, TargBoundry);

TargFilled = cat(3, TargFilledR, TargFilledG, TargFilledB);