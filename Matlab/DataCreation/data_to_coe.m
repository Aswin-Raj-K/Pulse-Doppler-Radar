clear;
clc;
file=input('Enter root file name for data file: ','s');
eval(['load ',file,'.mat'])
size = 313*40;
fileID = fopen('data.coe','w');
fprintf(fileID,'memory_initialization_radix=16;\n');
fprintf(fileID,'memory_initialization_vector=');

y = y.';
for i = 1:size
    element = y(i);
    y_real = real(element);
    y_img = imag(element);
    y_real_hex = dec2q(y_real,7,8,'hex');
    y_img_hex = dec2q(y_img,7,8,'hex');
    y_hex = append(y_img_hex,y_real_hex);
    if(i==size)
        fprintf(fileID,append(y_hex,";"));
    else
        fprintf(fileID,append(y_hex,"\n"));
    end
    
end

fclose(fileID);