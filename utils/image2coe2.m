%mcode to create a coe file
%���ɵ�������һ���н��ж�ȡ��
clear;
clc;
src = imread('image.jpg'); %����ͼƬ·��
R = src(:, :, 1);
G = src(:, :, 2);
B = src(:, :, 3);

m = size(R, 2);
n = size(R, 1);
N = m * n; % %���ݵĳ��ȣ����洢����ȡ�
word_len = 8; % %ÿ����Ԫ��ռ�ݵ�λ�������Լ��趨

R_data = reshape(R', 1, N);
G_data = reshape(G', 1, N);
B_data = reshape(B', 1, N);

fid = fopen('image_R.coe', 'wt'); %���ļ�
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', R_data(i));
end

fprintf(fid, '%d;', R_data(N)); % %�����β,ÿ�����ݺ����ö���(���߿ո���߻��з�)���������һ�����ݺ���ӷֺ�
fclose(fid); % %�ر��ļ�

fid = fopen('image_G.coe', 'wt'); %���ļ�
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', G_data(i));
end

fprintf(fid, '%d;', G_data(N)); % %�����β,ÿ�����ݺ����ö���(���߿ո���߻��з�)���������һ�����ݺ���ӷֺ�
fclose(fid); % %�ر��ļ�

fid = fopen('image_B.coe', 'wt'); %���ļ�
fprintf(fid, ';Width: %d, Height: %d\n\n', m, n);
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=10;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');

for i = 1:N - 1
    fprintf(fid, '%d,\n', B_data(i));
end

fprintf(fid, '%d;', B_data(N)); % %�����β,ÿ�����ݺ����ö���(���߿ո���߻��з�)���������һ�����ݺ���ӷֺ�
fclose(fid); % %�ر��ļ�
