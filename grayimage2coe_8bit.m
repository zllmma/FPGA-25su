%mcode to create a coe file
%���ɵ�������һ���н��ж�ȡ��
clear;
clc;
src = imread('2.bmp');
BW = rgb2gray(src);
[m, n] = size(BW); % m�� n��
figure(1);
imshow(src)
figure(2);
imshow(BW)
N = m * n; % %���ݵĳ��ȣ����洢����ȡ�
word_len = 8; % %ÿ����Ԫ��ռ�ݵ�λ�������Լ��趨
data = reshape(BW', 1, N); % 1��N��

%fid=fopen('gray_image.mif', 'w');%���ļ�
fid = fopen('2.coe', 'wt'); %���ļ�
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
BW2 = reshape(data2, n, m)'; % 1��N��
figure(3);
imshow(BW2)
fprintf(fid, '%s;', temp(1:4)); % %�����β,ÿ�����ݺ����ö���(���߿ո���߻��з�)���������һ�����ݺ���ӷֺ�
fclose(fid); % %�ر��ļ�
