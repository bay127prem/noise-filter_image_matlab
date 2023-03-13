function [] = exo1_cameraman(imgPath, noise, var)
    figure;
    I = imread(imgPath);
    
    subplot(221);
    imshow(I);
    title('original');
    
    subplot(222);
    if (strcmp(noise, 'salt & pepper') == true)
        J = imnoise(I, noise, var);
    else
        J = imnoise(I, noise, 0, var);
    end
    imshow(J);
    title(strcat('variance ', string(var)));
    
    var = var * 5;
    subplot(223);
    if (strcmp(noise, 'salt & pepper') == true)
        J = imnoise(I, noise, var);
    else
        J = imnoise(I, noise, 0, var);
    end
    imshow(J);
    title(strcat('variance ', string(var)));
    
    var = var / 10;
    subplot(224);
    if (strcmp(noise, 'salt & pepper') == true)
        J = imnoise(I, noise, var);
    else
        J = imnoise(I, noise, 0, var);
    end
    imshow(J);
    title(strcat('variance ', string(var)));
end