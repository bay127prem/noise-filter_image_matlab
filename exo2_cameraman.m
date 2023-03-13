function [] = exo2_cameraman(imgPath, noise, filter, var)
    figure;
    I = imread(imgPath);
    if (strcmp(noise, 'salt & pepper') == true)
        K = imnoise(I, noise, var);
    elseif (strcmp(noise, 'speckle') == true)
        K = imnoise(I, noise);
    else
        K = imnoise(I, noise, 0, var);
    end
    subplot(331);
    imshow(I);
    title('Bruits');
    
    A = zeros(101, 1);
    
    for i=1:50
        if (strcmp(filter, 'median') == false)
            H = fspecial(filter, 2*i+1);
            J=imfilter(K, H);
        else
            J=medfilt2(I,[2*i+1 2*i+1]);
        end
        
        if (i <= 3)
            subplot(33*10+i+3);
            imshow(J);
            title(strcat('taille ', string(2*i+1)));
        end
        
        if (i >= 48)
            subplot(33*10+mod(i, 3)+7);
            imshow(J);
            title(strcat('taille ', string(2*i+1)));
        end
        
        PSNR = psnr(J, I);
        A(2*i+1, 1) = PSNR;
    end
    
    figure
    bar(A);

    

end