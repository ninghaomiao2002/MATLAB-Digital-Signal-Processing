%% 1.2.2
% Define the parameters
% Maximum frequency component in the signal
fmax = 1000;
% Sampled Frequency
Fs = 8000;
% Time vector from 0 to 2 second
t = 0:1/Fs:0.5;       
% Create the original signal(sine wave)
analog_signal = sin(2*pi*fmax*t);
% Plot the original signal
figure;
% Set as the first subplot
subplot(5, 1, 1);
plot(t, analog_signal);
title('Original Analog Signal');
xlabel('Time (s)');
% Set x-axis limit to get more precise graph
xlim([0, 0.1]);
ylabel('Amplitude');
% Listen the Sound
sound(analog_signal);
% Add a pause in case the overlap of the sounds
pause(3);
% Perform digital sampling at different frequencies
% Different sampling frequencies
sample_freqs = [1000, 1500, 2000, 2500];
% Introduce a for loop for different Sampled Frequencies
for i = 1:length(sample_freqs)
    Fs_new = sample_freqs(i);
    sampled_signal = sin(2*pi*fmax*t);
    subplot(5, 1, i + 1);
    stem(t, sampled_signal);
    title(['Sampled Signal (Fs = ' num2str(Fs_new) ' Hz)']);
    xlabel('Time (s)');
    % Set x-axis limit to get more precise graph
    xlim([0, 0.1]);
    ylabel('Amplitude');
    % Play the sampled signal
    sound(sampled_signal, Fs_new);
    % Add a pause in case the overlap of the sounds
    pause(1+length(sampled_signal)/Fs_new);
end
%% 1.2.3
fmax_1 = 800;
fmax_2 = 7200;
Fs_1 = 8000;
% Maximum frequency component in the signal
t_1 = 0:1/Fs_1:1;       % Time vector from 0 to 1 second
% Create the original analog signal (sine wave)
Sampling_signal_1 = sin(2*pi*fmax_1*t_1);
Sampling_signal_2 = sin(2*pi*fmax_2*t_1);
% Plot the original analog signal
figure;
subplot(2, 1, 1);
plot(t_1, Sampling_signal_1);
title(['Original Signal (F0 = ' num2str(fmax_1) ' Hz)']);
xlim([0, 0.01]);
xlabel('Time (s)');
ylabel('Amplitude');
sound(Sampling_signal_1);
pause(2);

subplot(2, 1, 2);
stem(t_1, Sampling_signal_1);
title(['Sampled Signal (F0 = ' num2str(fmax_1) ' Hz)']);
xlim([0, 0.01]);
xlabel('Time (s)');
ylabel('Amplitude');
sound(Sampling_signal_1, Fs_1);
pause(1+length(Sampling_signal_1)/Fs_1);


figure;
subplot(2, 1, 1);
plot(t_1, Sampling_signal_2);
title(['Original Signal (F0 = ' num2str(fmax_2) ' Hz)']);
xlim([0, 0.01]);
xlabel('Time (s)');
ylabel('Amplitude');
sound(Sampling_signal_2);
pause(2);

subplot(2, 1, 2);
stem(t_1, Sampling_signal_2);
title(['Sampled Signal (F0 = ' num2str(fmax_2) ' Hz)']);
xlim([0, 0.01]);
xlabel('Time (s)');
ylabel('Amplitude');
sound(Sampling_signal_2, Fs_1);
pause(1+length(Sampling_signal_2)/Fs_1);

%% 1.2.4
load handel.mat
filename = 'handel.wav';
[y, Fs] = audioread('handel.wav');
% Display the sampling rate
disp(['Sampling rate of the original signal: ' num2str(Fs) ' Hz']);
% Define a range of undersampling frequencies
undersampling_freqs = [Fs/2,Fs/3,Fs/4,Fs/5,Fs/6,Fs/7,Fs/8];
% Create a figure with subplots
figure;
% Plot the original audio file
subplot(length(undersampling_freqs)+1, 1, 1);
plot((0:length(y)-1)/Fs, y);
title('Original Audio');
xlabel('Time (s)');
ylabel('Amplitude');
sound(y,Fs);
pause(1+length(y)/Fs);
% Loop through undersampling frequencies
for i = 1:length(undersampling_freqs)
    % Undersample the signal
    undersampled_signal = y(1:round(Fs/undersampling_freqs(i)):end);
    Fs_undersampled = Fs / round(Fs/undersampling_freqs(i));
    % Plot the undersampled signal
    subplot(length(undersampling_freqs)+1, 1, i+1);
    plot((0:length(undersampled_signal)-1)/Fs_undersampled, undersampled_signal);
    title(['Undersampled Audio (Fs = ' num2str(Fs_undersampled) ' Hz)']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    sound(undersampled_signal, Fs_undersampled);
    pause(1+length(undersampled_signal)/Fs_undersampled);
end



