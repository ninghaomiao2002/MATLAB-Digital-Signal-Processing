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
% Parameters for the Chebyshev Type I filter
clear all
filename = 'OSR_us_000_0010_8k.wav';
[y, fs] = audioread(filename);
% Parameters for the Chebyshev Type I filter
filter_order = 9;
fc = 3000;
% Design a Chebyshev Type I filter
[b, a] = cheby1(filter_order, 0.5, fc / (fs/2));
% Apply the filter to the corrupted speech to recover the original signal
recovered_speech = filter(b, a, y);
% Compute Mean Squared Error (MSE) between the original and recovered speech
mse_value_cheby = mean((y - recovered_speech).^2);
disp(['Mean Squared Error (Chebyshev Type I): ', num2str(mse_value_cheby)]);
% Save the recovered speech using Chebyshev Type I filter
audiowrite('recovered_speech_chebyI_order(9)_fc(3000).wav', recovered_speech, fs);
% Listen to the recovered speech with Chebyshev Type I filter (adjust volume as needed)
sound(recovered_speech);





