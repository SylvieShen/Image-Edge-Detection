clear all;  
close all;  
n=76800;%320*240 
mat = imread('2015301200101.bmp');%��ȡ.bmp�ļ�  
fid=fopen('logoimage.mif','w');%�򿪴�д���.mif�ļ�  
fprintf(fid,'WIDTH=8;\n');%д��洢λ��8λ  
fprintf(fid,'DEPTH=307200;\n');%д��洢���76800 
fprintf(fid,'ADDRESS_RADIX=UNS;\n');%д���ַ����Ϊ�޷�������  
fprintf(fid,'DATA_RADIX=HEX;');%д����������Ϊ16����  
fprintf(fid,'CONTENT BEGIN\n');%��ʼ����  
for i=0:n-1  
    x = mod(i,320)+1;  
    y = fix(i/320)+1;  
    k = mat(y,x);  
fprintf(fid,'\t%d:%x;\n',i,k);  
end  
fprintf(fid,'END;\n');  
fclose(fid);%�ر��ļ�  
