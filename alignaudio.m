%% alignaudio() Function.  
% This script uses MATLAB's alignsignals() function to align 2 audio files.
% Only the delay time calculated by this function is used to displace the
% the leading signal to bring it into alignment with the lagging signal. 
% Once the alignment has been carried out, the shortest of the two signals
% undergoes zero-padding add the end to ensure that the two output signals
% are the same sample length.
%
% The script only aligns single channels, therefore if more than one channel
% is present only the left channel is used.

%% Function definition

function [OUTCh1,OUTCh2,fs]=alignaudio(input1,input2)

[Ch1,fs1]=audioread(input1(1,:));
[Ch2,fs2]=audioread(input2(1,:));

if fs1~=fs2
    error('Audio file sample rates are not the same.'); 
    % Sample rates for the audio files to be processed by this function
    % must be the same.
end

fs=fs1;

[~,~,D] = alignsignals(Ch1,Ch2);
PadAlign = zeros(abs(D),1);

if D == 0 % No delay detected.

 OUTCh1 = Ch1; 
 OUTCh2 = Ch2;

elseif D>0 %Left leads, therefore it will be delayed. Pad added to Ch1. no pad added to Ch2.  

OUTCh1 = [PadAlign;Ch1];
OUTCh2 = Ch2;

elseif D<0 %Right leads, therefore it will be delayed. Pad added to Ch2. no pad added to Ch1.   

OUTCh1=Ch1;
OUTCh2=[PadAlign;Ch2]; %This is already padded by the alignsignals() function.

end

[Sz1,~]=size(OUTCh1);
[Sz2,~]=size(OUTCh2);

Mn=min([Sz1 Sz2]);
Mx=max([Sz1 Sz2]);   

ChPadSize= abs(Mx-Mn);
ChPad=zeros(ChPadSize,1);

if (Sz1>Sz2)
        
    OUTCh2=[OUTCh2;ChPad]; 
    
elseif (Sz2>Sz1)
    
    OUTCh1=[OUTCh1;ChPad];   
end

end
