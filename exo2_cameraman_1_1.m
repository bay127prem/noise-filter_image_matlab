function [] = exo2_cameraman_1_1(imgPath, noise, filter, var)
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
    
    A = zeros(50, 1);
    
    for i=1:100
        if (strcmp(filter, 'median') == false)
            H = fspecial(filter, 5);
            K=imfilter(K, H);
        else
            K = medfilt2(I,[5 5]);
        end
        
        if (i <= 3)
            subplot(33*10+i+3);
            imshow(K);
            title(strcat('iteration ', string(i)));
        end
        
        if (i >= 98)
            subplot(33*10+mod(i, 3)+7);
            imshow(K);
            title(strcat('iteration ', string(i)));
        end
        
        PSNR = psnr(K, I);
        A(i, 1) = PSNR;
    end
    
    figure
    bar(A);

    

end