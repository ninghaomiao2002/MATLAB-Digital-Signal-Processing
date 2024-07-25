%% 1.3.1
% set up the sampled frequency
fs = 8000;
% Test different notes and durations
note1 = 60; % Note number C4
duration1 = 1; % Duration in seconds
note2 = 74; % Note number D5
duration2 = 0.5; % Duration in seconds
note3 = -1; % Note number (e.g., note = -1 for test case)
duration3 = 1; % Duration in seconds
note4 = 29; % Note number F1
duration4 = 2; % Duration in seconds
note5 = 67; % Note number G4
duration5 = 1.5; % Duration in seconds
% Generate signals using createNote function
[x1, t1] = createNote(duration1, note1, fs);
[x2, t2] = createNote(duration2, note2, fs);
[x3, t3] = createNote(duration3, note3, fs);
[x4, t4] = createNote(duration4, note4, fs);
[x5, t5] = createNote(duration5, note5, fs);
% Plot the first signal
subplot(5, 1, 1);
plot(t1, x1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave (Note 60)');
% Plot the second signal
subplot(5, 1, 2);
plot(t2, x2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave (Note 74)');
% Plot the third signal
subplot(5, 1, 3);
plot(t3, x3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave (Note -1)');
% Plot the fourth signal
subplot(5, 1, 4);
plot(t4, x4);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave (Note 29)');
% Plot the fifth signal
subplot(5, 1, 5);
plot(t5, x5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave (Note 67)');