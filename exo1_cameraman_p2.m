function [Diff] = exo1_cameraman_p2(imgPath)
    figure;
    I = imread(imgPath);
    I = imnoise(I, 'gaussian', 0, 0.01);
    subplot(231);
    imshow(I);
    title('Bruits');
    
    H1 = [ 1 2 3 2 1; 2 4 6 4 2; 3 6 9 6 3; 2 4 6 4 2; 1 2 3 2 1] .* (1/81);
    J1=imfilter(I,H1);
    subplot(232);
    imshow(J1);
    title('Lissage');
    
    H2 = fspecial('average', 5);
    J2=imfilter(I,H2);
    subplot(233);
    imshow(J2);
    title('Lissage moyenne');
    
    Diff = abs(I - J1);
    subplot(234);
    imshow(Diff);
    title('Diff1');
    
    Diff = abs(I - J2);
    subplot(235);
    imshow(Diff);
    title('Diff2');
end