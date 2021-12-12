y = hamming(40);
y_hex = dec2q(y,7,8,'hex');
fileID = fopen('hamming.coe','w');
fprintf(fileID,'memory_initialization_radix=16;\n');
fprintf(fileID,'memory_initialization_vector=');

for i = 1:40
    
    if(i==40)
        fprintf(fileID,append(y_hex(i,:),";"));
    else
        fprintf(fileID,append(y_hex(i,:),"\n"));
    end
end

fclose(fileID);