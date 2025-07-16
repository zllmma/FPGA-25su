%mcode to create a coe file
%生成的数据是一行行进行读取的
clear;
clc;
src = imread('2.bmp');
BW = rgb2gray(src);
[m, n] = size(BW); % m行 n列
figure(1);
imshow(src)
figure(2);
imshow(BW)
N = m * n; % %数据的长度，即存储器深度。
word_len = 8; % %每个单元的占据的位数，需自己设定
data = reshape(BW', 1, N); % 1行N列

%fid=fopen('gray_image.mif', 'w');%打开文件
fid = fopen('2.coe', 'wt'); %打开文件
fprintf(fid, ';Height: %d, Wdith: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=2;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

data2 = [];

for i = 1:N - 1
    temp = dec2bin(data(i), word_len);
    data2 = [data2, uint8(bin2dec(temp(1:4)))];
    fprintf(fid, '%s,\n', temp(1:4));
end

temp = dec2bin(data(N), word_len);
data2 = [data2, uint8(bin2dec(temp(1:4)))];
data2 = uint8(data2) * 16;
BW2 = reshape(data2, n, m)'; % 1行N列
figure(3);
imshow(BW2)
fprintf(fid, '%s;', temp(1:4)); % %输出结尾,每个数据后面用逗号(或者空格或者换行符)隔开，最后一个数据后面加分号
fclose(fid); % %关闭文件
