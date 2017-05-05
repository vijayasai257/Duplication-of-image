I = imread('peppers.jpg');
[r c d] = size(I);
if d>1
    I  = rgb2gray(I);
end
imshow(I);
figure;
array = [];
[ir,ic] = size(I);
for mr = 1:100:r
    for mc = 1:100:c
        mask = I(mr:mr+99,mc:mc+99);
        imshow(mask);
        %sleep(0.10);
        figure;
        for yr= 1:100:r 
            for yc = 1:100:c 
                flag = 1;
                if(mr == yr && mc == yc )
                    array = [array;0];
                else
                    cropped_image = I(yr:yr+99,yc:yc+99);
                    x = im(mask,cropped_image);
                    if x<1&& x>0
                        x = 0;
                        flag = 0;                        
                    else if x<1.5 
                            x = 0;
                            flag = 0;
                        end
                    end
                    if(flag ~= 0)
                        rectangle('position',[yr,yc,100,100],'LineWidth',2, 'EdgeColor','b');
                    end
                    
                    array = [array;x];
                end %end if
            end
        end
        h = plot(array);
        %saveas(h,'E:\plot.jpg');
        %saveas(h,[plot_num2str(mc)],'jpg');
        %[xc yc] = ginput(1);
        %position = get(Figure1,'Position');
        %[xc1 yc1] = ginput(1);
        array = zeros();
        figure;
    end
end



