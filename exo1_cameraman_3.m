function [] = exo1_cameraman_3(imgPath)
    figure;
    I = imread(imgPath);
    
    subplot(131);
    imshow(I);
    title('original');
    
    subplot(132);
    J = imnoise(I, 'salt & pepper', 0.05);
    imshow(J);
    title('salt & pepper');
    
    subplot(133);
    J = imnoise(I, 'gaussian', 0, 0.01);
    imshow(J);
    title('gaussian');
end