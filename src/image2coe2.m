%mcode to create a coe file
%生成的数据是一行行进行读取的
clear;
clc;
src = imread('image.jpg'); %设置图片路径
R = src(:, :, 1);
G = src(:, :, 2);
B = src(:, :, 3);

m = size(R, 2);
n = size(R, 1);
N = m * n; % %数据的长度，即存储器深度。
word_len = 8; % %每个单元的占据的位数，需自己设定

R_data = reshape(R', 1, N);
G_data = reshape(G', 1, N);
B_data = reshape(B', 1, N);

fid = fopen('image_R.coe', 'wt'); %打开文件
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', R_data(i));
end

fprintf(fid, '%d;', R_data(N)); % %输出结尾,每个数据后面用逗号(或者空格或者换行符)隔开，最后一个数据后面加分号
fclose(fid); % %关闭文件

fid = fopen('image_G.coe', 'wt'); %打开文件
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', G_data(i));
end

fprintf(fid, '%d;', G_data(N)); % %输出结尾,每个数据后面用逗号(或者空格或者换行符)隔开，最后一个数据后面加分号
fclose(fid); % %关闭文件

fid = fopen('image_B.coe', 'wt'); %打开文件
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', B_data(i));
end

fprintf(fid, '%d;', B_data(N)); % %输出结尾,每个数据后面用逗号(或者空格或者换行符)隔开，最后一个数据后面加分号
fclose(fid); % %关闭文件
