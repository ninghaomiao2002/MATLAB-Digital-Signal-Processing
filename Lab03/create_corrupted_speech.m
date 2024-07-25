clear all
filename = 'OSR_us_000_0010_8k.wav';
[y, fs] = audioread(filename);

d = length(y) / fs;
note = 105; % Note number as specified
start = 0; % Start time for the tone
amplitude = 0.1; % Adjust amplitude as needed

%super-imposed tone created with createNote.m
%use same sampling frequency as the speech file i.e. fs=8000Hz
[x,new_t] = createNote(d,note,fs,start,amplitude);
%select the min length of the audio
min_length = min(length(x),length(y));
x1 = x(1:min_length);
y1 = y(1:min_length);


%add the two signals (wav file and tone)
%x=...;
corrupted_speech = x1+y1;
mse_value = sum((corrupted_speech - y).^2)/length(y);
disp(['Mean Squared Error: ', num2str(mse_value)]);
%listen to the resulting corrupted speech
sound(corrupted_speech);