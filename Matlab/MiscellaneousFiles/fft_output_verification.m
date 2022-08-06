clear;
clc;
fileID = fopen('fft_output.txt','r');
data = zeros(1,32);
N = 32;
fs = 15e3;
temp = linspace(-15,15,32);

values = fscanf(fileID,'%c');
for i = 1:32
    l = (i-1)*10+1;
    A = values(1,l:l+7);
    value = q2dec(A(1:4),7,8,'hex') + j*q2dec(A(5:8),7,8,'hex');
    data(i) = value;
end
fclose(fileID);