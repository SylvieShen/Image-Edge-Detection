clear all; 
close all;
imag = imread('myimg.bmp');  %��ȡ�ؼ�֡
imag = rgb2gray(imag);        %ת��Ϊ�Ҷ�ͼ
subplot(131);imshow(imag);
title('ԭͼ'); 
[high,width] = size(imag);   % ���ͼ��ĸ߶ȺͿ��
F2 = double(imag);        
U = double(imag);       
uSobel = imag;
for i = 2:high - 1   %sobel��Ե���
    for j = 2:width - 1
        Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        uSobel(i,j) = sqrt(Gx^2 + Gy^2); 
    end
end 
subplot(132);imshow(im2uint8(uSobel));
title('��Ե����');  %������Ե�����ͼ��
% Matlab�Դ�������Ե���
% KΪ��ȡ�õ��Ĺؼ�֡�ĻҶ�ͼ
BW3 = edge(imag,'sobel', 0.09);
subplot(133);imshow(BW3,[]);
title('Matlab�Դ�������Ե���');