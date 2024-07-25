%% Piano full note
% Load the audio file
file_path = 'piano-C5.wav';
[y_piano, fs_piano] = audioread(file_path);
file_path = 'trumpet-C5.wav';
[y_trumpet, fs_trumpet] = audioread(file_path);
file_path = 'violin-C5.wav';
[y_violin, fs_violin] = audioread(file_path);
file_path = 'flute-C5.wav';
[y_flute, fs_flute] = audioread(file_path);
% Set parameters for the spectrogram

window_length_piano = length(y_piano);
window_length_trumpet = length(y_trumpet);
window_length_violin = length(y_violin);
window_length_flute = length(y_flute);
overlap = 0; % Set the overlap to be half the window length
nfft_piano = window_length_piano; 
nfft_trumpet = window_length_trumpet; 
nfft_violin = window_length_violin; 
nfft_flute = window_length_flute; 
% Create the spectrogram
% [S, F, T] = spectrogram(y_piano, 2, 1, 2, fs);
[S_piano, F_piano, T_piano] = spectrogram(y_piano, window_length_piano, overlap, nfft, fs_piano);
[S_trumpet, F_trumpet, T_trumpet] = spectrogram(y_trumpet, window_length_trumpet, overlap, nfft, fs_trumpet);
[S_violin, F_violin, T_violin] = spectrogram(y_violin, window_length_violin, overlap, nfft, fs_violin);
[S_flute, F_flute, T_flute] = spectrogram(y_flute, window_length_flute, overlap, nfft, fs_flute);
% Plot the spectrogram in grayscale with white background
figure;
subplot(4, 1, 1);
imagesc(T, F, 10*log10(abs(S_piano)), [min(min(10*log10(abs(S_piano)))) max(max(10*log10(abs(S_piano))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Full Piano Note');
colorbar;

subplot(4, 1, 2);
imagesc(T, F, 10*log10(abs(S_trumpet)), [min(min(10*log10(abs(S_trumpet)))) max(max(10*log10(abs(S_trumpet))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Full Trumpet Note');
colorbar;

subplot(4, 1, 3);
imagesc(T, F, 10*log10(abs(S_violin)), [min(min(10*log10(abs(S_violin)))) max(max(10*log10(abs(S_violin))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Full Violin Note');
colorbar;

subplot(4, 1, 4);
imagesc(T, F, 10*log10(abs(S_flute)), [min(min(10*log10(abs(S_flute)))) max(max(10*log10(abs(S_flute))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Full Flute Note');
colorbar;

%% Piano 40ms
% Load the audio file
file_path = 'piano-C5.wav';
[y_piano, fs] = audioread(file_path);
% Set parameters for the spectrogram
desired_window_duration = 0.04; % 40 ms
window_length = 2^nextpow2(round(desired_window_duration * fs)); % Round up to the nearest power of two
overlap = round(window_length / 2); % Set the overlap to be half the window length
nfft = window_length; % Number of FFT points, equal to window length for no zero-padding
% Create the spectrogram
% [S, F, T] = spectrogram(y_piano, 2, 1, 2, fs);
[S, F, T] = spectrogram(y_piano, window_length, overlap, nfft, fs);
% Plot the spectrogram in grayscale with white background
imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Piano Note 40ms');
% Add a colorbar to show intensity
colorbar;
sound(y_piano, fs);
%% Trumpet 40ms
% Load the audio file
file_path = 'trumpet-C5.wav';
[y_trumpet, fs] = audioread(file_path);
% Set parameters for the spectrogram
desired_window_duration = 0.04; % 40 ms
window_length = 2^nextpow2(round(desired_window_duration * fs)); % Round up to the nearest power of two
overlap = round(window_length / 2); % Set the overlap to be half the window length
nfft = window_length; % Number of FFT points, equal to window length for no zero-padding

% Create the spectrogram
[S, F, T] = spectrogram(y_trumpet, window_length, overlap, nfft, fs);
% Plot the spectrogram in grayscale with white background
imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of Trumpet Note 40ms');
% Add a colorbar to show intensity
colorbar;
sound(y_trumpet, fs);
%% Violin 40ms
% Load the audio file
file_path = 'violin-C5.wav';
[y_violin, fs] = audioread(file_path);
% Set parameters for the spectrogram
desired_window_duration = 0.04; % 40 ms
window_length = 2^nextpow2(round(desired_window_duration * fs)); % Round up to the nearest power of two
overlap = round(window_length / 2); % Set the overlap to be half the window length
nfft = window_length; % Number of FFT points, equal to window length for no zero-padding
% Create the spectrogram
[S, F, T] = spectrogram(y_violin, window_length, overlap, nfft, fs);
% Plot the spectrogram in grayscale with white background
imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of violin Note 40ms');
% Add a colorbar to show intensity
colorbar;
sound(y_violin, fs);
%% Flute 40ms
% Load the audio file
file_path = 'flute-C5.wav';
[y_flute, fs] = audioread(file_path);
% Set parameters for the spectrogram
desired_window_duration = 0.04; % 40 ms
window_length = 2^nextpow2(round(desired_window_duration * fs)); % Round up to the nearest power of two
overlap = round(window_length / 2); % Set the overlap to be half the window length
nfft = window_length; % Number of FFT points, equal to window length for no zero-padding
% Create the spectrogram
[S, F, T] = spectrogram(y_flute, window_length, overlap, nfft, fs);
% Plot the spectrogram in grayscale with white background
imagesc(T, F, 10*log10(abs(S)), [min(min(10*log10(abs(S)))) max(max(10*log10(abs(S))))]);
set(gca, 'YDir', 'normal'); % This is to ensure that the frequency axis is displayed correctly
% Set the figure background color to white
set(gcf, 'color', 'w');
% Add labels and title
xlabel('Time (seconds)');
ylabel('Frequency (Hz)');
title('Spectrogram of flute Note 40ms');
% Add a colorbar to show intensity
colorbar;
sound(y_flute, fs);
