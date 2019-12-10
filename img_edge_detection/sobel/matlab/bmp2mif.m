clear all;  
close all;  
n=76800;%320*240 
mat = imread('2015301200101.bmp');%读取.bmp文件  
fid=fopen('logoimage.mif','w');%打开待写入的.mif文件  
fprintf(fid,'WIDTH=8;\n');%写入存储位宽8位  
fprintf(fid,'DEPTH=307200;\n');%写入存储深度76800 
fprintf(fid,'ADDRESS_RADIX=UNS;\n');%写入地址类型为无符号整型  
fprintf(fid,'DATA_RADIX=HEX;');%写入数据类型为16进制  
fprintf(fid,'CONTENT BEGIN\n');%起始内容  
for i=0:n-1  
    x = mod(i,320)+1;  
    y = fix(i/320)+1;  
    k = mat(y,x);  
fprintf(fid,'\t%d:%x;\n',i,k);  
end  
fprintf(fid,'END;\n');  
fclose(fid);%关闭文件  
