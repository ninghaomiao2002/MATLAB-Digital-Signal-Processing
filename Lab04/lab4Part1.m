%% 1.1.1
% initialize parameters
fs = 8000;
note = 110;
d = 2;
start = 0;
% use createNote and my_FFT
[x,new_t] = createNote(d, note, fs, start);
[Y,f]=my_FFT(x,fs);
% Plot the results
figure;
% Plot the waveform
subplot(2, 1, 1);
plot(new_t, x);
title(['Generated Note ' num2str(note)]);
xlabel('Time (seconds)');
ylabel('Amplitude');
% Plot the discrete Fourier transform
subplot(2, 1, 2);
plot(f, abs(Y));
title('Discrete Fourier Transform');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

%% 1.1.2
fs = 8000;
durations = [1, 1, 1, 1];  
notes = [60, 64, 68, 72];
starts = [0, 1, 2, 3];
melody = createMusic(durations, notes, fs, starts);
% use my_FFT
[Y, f] = my_FFT(melody, fs);
% Plot the results
figure;
% Plot the waveform
subplot(2, 1, 1);
plot((1:length(melody))/fs, melody);
title('Generated Melody');
xlabel('Time (seconds)');
ylabel('Amplitude');
% Plot the discrete Fourier transform
subplot(2, 1, 2);
plot(f, abs(Y));
title('Discrete Fourier Transform');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');