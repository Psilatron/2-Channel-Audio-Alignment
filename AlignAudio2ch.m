clear;

file1='file1.wav';
file2='file2.wav';

[x,y,Fs]=alignaudio(file1,file2);

z = [x(:),y(:)];

audiowrite('OUTPUT.wav',z,Fs); 
