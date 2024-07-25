% lab4Part3.m
%% 1.3.2
% Specify the path to the audio file
audio_file = 'QueenAnotherOneBitesTheDust.mp3'; % Adjust the path
% Read the audio file
[audio, fs] = audioread(audio_file);
% Specify the time range in seconds
start_time = 2*60 + 28; % 2 minutes and 28 seconds
end_time = 2*60 + 31;   % 2 minutes and 31 seconds
% Convert time to samples
start_sample = round(start_time * fs);
end_sample = round(end_time * fs);
% Extract the desired time sequence
segment = audio(start_sample:end_sample);
window_length = 20;
overlap = round(window_length / 2);
nfft = window_length;
figure;
[S, F, T] = spectrogram(segment, window_length, overlap, nfft, fs);
imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Another One Bites the Dust');
colorbar;
sound(segment,fs);

%% 1.3.3
% Part 1: Spectrogram for Different Window Lengths
% Load the speech file
[speech, fs] = audioread('OSR_us_000_0010_8k.wav');
% Define different window lengths
window_lengths = [20, 50, 70, 100]; % Choose window lengths in milliseconds

% Plot spectrograms for different window lengths
figure;
for i = 1:length(window_lengths)
    window_length = window_lengths(i);
    % Convert window length to samples
    % window_samples = round(window_length * fs / 1000);
    overlap = round(window_length / 2);
    nfft = window_length;
    % Plot the spectrogram
    subplot(length(window_lengths), 1, i);
    [S, F, T] = spectrogram(speech, window_length, overlap, nfft, fs);
    imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
    set(gca, 'YDir', 'normal');
    set(gcf, 'color', 'w');
    % Add labels and title
    xlabel('Time (seconds)');
    ylabel('Frequency (Hz)');
    title(['Spectrogram for windowlength = ', num2str(window_length), ' ms']);
    colorbar;
end

% Part 2: Corrupt Speech File with Superimposed Tone

% Parameters for the superimposed tone
tone_frequency = 2000; % Choose a frequency in Hz
tone_amplitude = 0.5; % Choose an amplitude (adjust as needed)

% Generate the superimposed tone
t = (0:1/fs:(length(speech)-1)/fs)';
tone = tone_amplitude * sin(2 * pi * tone_frequency * t);

% Corrupt the speech file with the superimposed tone
corrupted_speech = speech + tone;

% Plot the spectrogram for a window of your choice
figure;
window_length_1 = 50;
overlap_1 = round(window_length_1 / 2);
nfft_1 = window_length_1;
[S_1, F_1, T_1] = spectrogram(corrupted_speech, window_length_1, overlap_1, nfft_1, fs);
imagesc(T_1, F_1, 10*log10(abs(S_1)), [min(min(10*log10(abs(S_1)))) max(max(10*log10(abs(S_1))))]);
set(gca, 'YDir', 'normal');
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title(['Spectrogram for windowlength = ', num2str(window_length), ' ms']);
colorbar;
%% Patient part
% Load the datasets
normal_data = readtable('ptbdb_normal.csv');
arrhythmia_data = readtable('ptbdb_abnormal.csv');
% Extract ECG signals for one patient from each dataset
normal_patient = normal_data{1, 1:end};
arrhythmia_patient = arrhythmia_data{1, 1:end};

figure;
subplot(2, 1, 1);
plot(normal_patient);
title('ECG of Healthy Patient');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(arrhythmia_patient);
title('ECG of Patient with Arrhythmia');
xlabel('Time');
ylabel('Amplitude');

% Generate spectrograms
fs = 4000; % Assuming a sampling frequency of 1000 Hz, adjust as needed
window_length_2 = 30;
overlap_2 = round(window_length_2 / 2);
nfft_2 = window_length_2;

figure;
subplot(2, 1, 1);
[S_2, F_2, T_2] = spectrogram(normal_patient, window_length_2, overlap_2, nfft_2, fs);
imagesc(T_2, F_2, 10*log10(abs(S_2)), [min(min(10*log10(abs(S_2)))) max(max(10*log10(abs(S_2))))]);
set(gca, 'YDir', 'normal');
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title(['Spectrogram for windowlength = ', num2str(window_length_2), ' ms']);
colorbar;

subplot(2, 1, 2);
[S_3, F_3, T_3] = spectrogram(arrhythmia_patient, window_length_2, overlap_2, nfft_2, fs);
imagesc(T_3, F_3, 10*log10(abs(S_3)), [min(min(10*log10(abs(S_3)))) max(max(10*log10(abs(S_3))))]);
set(gca, 'YDir', 'normal');
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title(['Spectrogram for windowlength = ', num2str(window_length_2), ' ms']);
colorbar;