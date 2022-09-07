clearvars
clc

Iref = imread('cameraman.tif');

Imoved = circshift(Iref, [-10 -15]);

pxShift = xcorrreg(Iref, Imoved);
corrImg = shiftimg(Imoved, pxShift);

%Crop the images to keep only registered portions
if pxShift(1) < 0

    corrImg(size(Imoved, 1) + pxShift(1):end, :) = [];
    Iref(size(Iref, 1) + pxShift(1):end, :) = [];

else

    corrImg(1:pxShift(1), :) = [];
    Iref(1:pxShift(1), :) = [];

end

if pxShift(2) < 0

    corrImg(:, size(Imoved, 2) + pxShift(2):end) = [];
    Iref(:, size(Iref, 2) + pxShift(2):end) = [];


else

    corrImg(:, 1:pxShift(2)) = [];
    Iref(:, 1:pxShift(2)) = [];

end


imshow(imfuse(Iref, corrImg))


