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
filter_order = 20;
cutoff_frequency = 2500;
[b,a] = butter(filter_order, cutoff_frequency / (fs/2), 'low');
recovered_signal = filter(b,a,corrupted_speech);
recovered_mse_value = sum((recovered_signal - y).^2)/length(y);
sound(recovered_signal);
audiowrite('recovered_speech_low-pass_Butterworth_fc(2500).wav', recovered_signal, fs);
disp(['Mean Squared Error of low-pass Butterworth IIR: ', num2str(recovered_mse_value)]);









