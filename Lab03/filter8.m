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
% Parameters for the Kaiser filter
fc = 3000;   % Passband Frequency
% Design a Lowpass Kaiser filter
filter_order = 10; % Adjust the filter order based on your requirements
kaiser_beta = 0.5;   % Adjust the Kaiser window shape parameter based on your requirements
% Design the Kaiser window
kaiser_window = kaiser(filter_order + 1, kaiser_beta);
% Design the FIR filter using the Kaiser window
fir_filter = fir1(filter_order, fc / (fs/2), 'low', kaiser_window);
% Apply the filter to the corrupted speech to recover the original signal
recovered_speech = filter(fir_filter, 1, y);
% Compute Mean Squared Error (MSE) between the original and recovered speech
mse_value_kaiser = mean((y - recovered_speech).^2);
disp(['Mean Squared Error Kaiser Filter: ', num2str(mse_value_kaiser)]);
% Save the recovered speech using the Kaiser filter
audiowrite('recovered_speech_kaiser_order(10)_fc(3000).wav', recovered_speech, fs);
% Listen to the recovered speech with the Kaiser filter (adjust volume as needed)
sound(recovered_speech);