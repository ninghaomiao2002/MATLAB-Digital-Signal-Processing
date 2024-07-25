%% Function createNote for note creating
function [x,t] = creatNote(d,f_note ,fs)
   % 
   if f_note == -1
       x = zeros(1, round(d*fs));
       t = 0:(1/fs+1):d;
       disp(['Frequency of note = -1 is 0 Hz']);
   % Because if we want one octave up, we need to add 12 and as a result,
   % we still need to make sure that the output frequencies are 0
   elseif f_note == 11
       x = zeros(1, round(d*fs));
       t = 0:(1/fs+1):d;
       disp(['Frequency of note = -1 is 0 Hz']);
   else
       % function for express the frequency using note
       f0 = 440*2^((f_note-69)/12);
       t = 0:1/fs:d;
       x = sin(2*pi*f0*t);
       disp(['Frequency of note = ' num2str(f_note) ' is ' num2str(f0) ' Hz']);
   end
end

