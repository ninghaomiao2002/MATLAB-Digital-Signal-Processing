%% 
% introduce two note sequences with different length
note_numbers_1 = [60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 77, 79, 81, 83];
note_numbers_2 = [60, 60, 67, 67, 69, 69, 67, -1, 65, 65, 64, 64, 62, 62, 60];
% Example durations, after testing and get the best length
durations_1 = 0.08 * ones(1, length(note_numbers_1)); 
durations_2 = 0.08 * ones(1, length(note_numbers_2));
% Sampling frequency
fs = 8000; 
% use createMelody function to get the melodys
melody_1 = createMelody(durations_1, note_numbers_1, fs);
melody_2 = createMelody(durations_2, note_numbers_2, fs);
% define time frequencies
time_1 = (0:length(melody_1)-1) / fs;
time_2 = (0:length(melody_2)-1) / fs;
% Plot the melody against time
figure;
plot(time_1, melody_1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 1');
% Listen to the melody
soundsc(melody_1, fs);
pause(3);
% Save the melody as a WAV file
audiowrite('melody_signal_1.wav', melody_1, fs);
figure;
plot(time_2, melody_2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 2');
% Listen to the melody
soundsc(melody_2, fs);
pause(3);
% Save the melody as a WAV file
audiowrite('melody_signal_2.wav', melody_2, fs);
% Can use info = audioinfo("melody1.wav") to check .wav file's location


%%
% Make the melody to be one octave higher
higher_octave_1 = note_numbers_1 + 12; % Shift up by 12 notes (one octave)
higher_octave_2 = note_numbers_2 + 12; % Shift up by 12 notes (one octave)

% Create the modified melody
higher_octave_signal_1 = createMelody(durations_1, higher_octave_1, fs);
higher_octave_signal_2 = createMelody(durations_2, higher_octave_2, fs);

higher_octave_time_1 = (0:length(higher_octave_signal_1)-1) / fs;
higher_octave_time_2 = (0:length(higher_octave_signal_2)-1) / fs;
% Plot the melody against time
figure;
subplot(2, 1, 1);
plot(time_1, melody_1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 1');
subplot(2, 1, 2);
plot(higher_octave_time_1, higher_octave_signal_1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal with Higher Octave Note sequence Example 1');
% Listen to the modified melody and save it as a WAV file
soundsc(higher_octave_signal_1, fs);
pause(3);
figure;
subplot(2, 1, 1);
plot(time_2, melody_2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 2');
subplot(2, 1, 2);
plot(higher_octave_time_2, higher_octave_signal_2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal with Higher Octave Note sequence Example 2');
soundsc(higher_octave_signal_2, fs);
pause(3);
audiowrite('higher_octave_signal_1.wav', higher_octave_signal_1, fs);
audiowrite('higher_octave_signal_2.wav', higher_octave_signal_2, fs);
%%
% Update the duration for faster durations
faster_durations_1 = durations_1 * 0.5; % Play 50% faster
faster_durations_2 = durations_2 * 0.5; % Play 50% faster
% Create the modified melody
faster_signal_1 = createMelody(faster_durations_1, note_numbers_1, fs);
faster_signal_2 = createMelody(faster_durations_2, note_numbers_2, fs);
faster_time_1 = (0:length(faster_signal_1)-1) / fs;
faster_time_2 = (0:length(faster_signal_2)-1) / fs;

% Plot the melody against time
figure;
subplot(2, 1, 1);
plot(time_1, melody_1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 1');
subplot(2, 1, 2);
plot(faster_time_1, faster_signal_1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal with Faster Speed Note sequence Example 1');
% Listen to the modified melody and save it as a WAV file
soundsc(faster_signal_1, fs);
pause(3);
figure;
subplot(2, 1, 1);
plot(time_2, melody_2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal Note sequence Example 2');
subplot(2, 1, 2);
plot(faster_time_2, faster_signal_2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Melody Signal with Faster Speed Note sequence Example 2');
soundsc(faster_signal_2, fs);
audiowrite('faster_signal_1.wav', faster_signal_1, fs);
audiowrite('faster_signal_2.wav', faster_signal_2, fs);

