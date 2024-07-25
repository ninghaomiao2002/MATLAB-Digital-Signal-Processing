%% 1.2.1
fs = 8000;
durations = [1, 1];  
notes = [60, 80];
starts = [0, 0];

melody = createMusic(durations, notes, fs, starts);

[Y, f] = my_FFT(melody, fs);

figure;
subplot(2, 1, 1);
plot((1:length(melody))/fs, melody);
title('Generated Melody');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(f, abs(Y));
title('Discrete Fourier Transform');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');


cutoff_frequency = 500;  

% Create vectors for ideal lowpass and highpass filters
HLP = zeros(size(f));
HHP = zeros(size(f));

% Apply conditions to modify the values of the vectors
HLP(abs(f) < cutoff_frequency) = 1;
HHP(abs(f) >= cutoff_frequency) = 1;

% Calculation
Z_HLP = Y .* HLP;
Z_HHP = Y .* HHP;


filtered_signal_HLP = my_FFTinv(Z_HLP);
filtered_signal_HHP = my_FFTinv(Z_HHP);

[Y_LP, f_LP] = my_FFT(filtered_signal_HLP, fs);
[Y_HP, f_HP] = my_FFT(filtered_signal_HHP, fs);

% Original sound
sound(melody, fs);
pause(5);

% HLP
figure;
subplot(2, 1, 1);
plot((1:length(filtered_signal_HLP))/fs, filtered_signal_HLP);
title('Filtered Audio Signal(Lowpass)');
xlabel('Time (seconds)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(f_LP, abs(Y_LP));
title('DFT of Filtered Audio Signal(Lowpass)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
sound(abs(filtered_signal_HLP), fs);
pause(3);

% HHP
figure;
subplot(2, 1, 1);
plot((1:length(filtered_signal_HHP))/fs, filtered_signal_HHP);
title('Filtered Audio Signal(Highpass)');
xlabel('Time (seconds)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(f_HP, abs(Y_HP));
title('DFT of Filtered Audio Signal(Highpass)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
sound(abs(filtered_signal_HHP), fs);

%% 1.2.2 Step 1: Create signal x1
% set initial parameters
fs = 8000;  
duration = [2, 2, 2, 2, 2];  
start_x1 = [0, 2, 4, 6, 8];
% Choose notes for x1
notes_x1 = [52, 56, 60, 64, 68];

% Create signal x1 using createMusic function
x1 = createMusic(duration, notes_x1, fs, start_x1);

% Listen to the signal x1
sound(x1, fs);

% Calculate and Plot the discrete Fourier transform of x1
[Y_x1, f_x1] = my_FFT(x1, fs);

figure;
subplot(2, 1, 1);
plot((1:length(x1))/fs, x1);
title('Signal x1');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(f_x1, abs(Y_x1));
title('DFT of Signal x1');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

%% 1.2.2 Step 2: Create signal x2
% set initial parameters
fs = 8000;  
duration = [2, 2, 2, 2, 2];  
start_x2 = [0, 2, 4, 6, 8];
% Choose notes for x1
notes_x2 = [74, 78, 82, 86, 90];

% Create signal x1 using createMusic function
x2 = createMusic(duration, notes_x2, fs, start_x2);

% Listen to the signal x1
sound(x2, fs);

% Calculate and Plot the discrete Fourier transform of x1
[Y_x2, f_x2] = my_FFT(x2, fs);

figure;
subplot(2, 1, 1);
plot((1:length(x2))/fs, x2);
title('Signal x1');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(f_x2, abs(Y_x2));
title('DFT of Signal x1');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');


%% Step 3: Create signal x = x1 + x2
fs = 8000;  
duration = [2, 2, 2, 2, 2];  
start_x1 = [0, 2, 4, 6, 8];
notes_x1 = [52, 56, 60, 64, 68];
x1 = createMusic(duration, notes_x1, fs, start_x1);

start_x2 = [0, 2, 4, 6, 8];
notes_x2 = [74, 78, 82, 86, 90];
x2 = createMusic(duration, notes_x2, fs, start_x2);

x = x1 + x2;

% Determine cutoff frequency to separate x1 and x2
cutoff_frequency = 586;  
% 416-587

% Create filters HLP_x and HHP_x
[Y_sum , f_x] = my_FFT(x, fs);
HLP_x = zeros(size(f_x));
HHP_x = zeros(size(f_x));

HLP_x(abs(f_x) < cutoff_frequency) = 1;
HHP_x(abs(f_x) > cutoff_frequency) = 1;

% Step 4: Reconstruct signals y1 and y2
y1 = my_FFTinv(my_FFT(x, fs) .* HLP_x);
y2 = my_FFTinv(my_FFT(x, fs) .* HHP_x);

[YLP, fy1_LP] = my_FFT(y1, fs);
[YHP, fy2_HP] = my_FFT(y2, fs);

figure;
subplot(2, 1, 1);
plot((1:length(y1))/fs, y1);
title('Signal x1 after Low Passband Filter');
xlabel('Time (seconds)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(fy1_LP, abs(YLP));
title('DFT of Signal x1 after Low Passband Filter');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
sound(y1, fs);
pause(10);

figure;
subplot(2, 1, 1);
plot((1:length(y2))/fs, y2);
title('Signal x2 after High Passband Filter');
xlabel('Time (seconds)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(fy2_HP, abs(YHP));
title('DFT of Signal x2 after High Passband Filter');
xlabel('Frequency (Hz)');   
ylabel('|Y(f)|');
sound(y2, fs);

% Calculate Euclidean distance

euclidean_distance_x1 = sqrt(sum((x1 - y1).^2));
euclidean_distance_x2 = sqrt(sum((x2 - y2).^2));

disp(['Euclidean Distance between x1 and y1: ', num2str(euclidean_distance_x1)]);
disp(['Euclidean Distance between x2 and y2: ', num2str(euclidean_distance_x2)]);
