% Define the discrete-time index vector t
t = -3:1:7;
% Define the signal x[n]
x = zeros(size(t)); % Initialize x with zeros
x(t == 0) = 1; 
x(t == 1) = 2; 
x(t == 3) = -1; 
x(t == 4) = 1; 
x(t == 5) = 2; 
% Plot the signal
% stem(t, x); % Plot discrete-time sequence as stems
% title('Discrete-Time Signal x[n]=δ[n]+2δ[n-1]-δ[n-3]+δ[n-4]+2δ[n-5]');
% xlabel('t');
% ylabel('Amplitude');
% xlim([min(t) max(t)]); % Set the x-axis limits based on the range of n
% ylim([-2 3]); % Set the y-axis limits
% grid on; % Enable the grid
% Delayed signal (x delayed by 2 samples)
t_delayed = -3:1:7;
% Define the signal x[n]
x_delayed = zeros(size(t)); % Initialize x with zeros
x_delayed(t_delayed == 2) = 1; 
x_delayed(t_delayed == 3) = 2; 
x_delayed(t_delayed == 5) = -1; 
x_delayed(t_delayed == 6) = 1; 
x_delayed(t_delayed == 7) = 2;

% Advanced signal (x advanced by 3 samples)
t_advanced = -3:1:7;
% Define the signal x[n]
x_advanced = zeros(size(t)); % Initialize x with zeros
x_advanced(t_advanced == -3) = 1; 
x_advanced(t_advanced == -2) = 2; 
x_advanced(t_advanced == 0) = -1; 
x_advanced(t_advanced == 1) = 1; 
x_advanced(t_advanced == 2) = 2;
figure;
% Plot the original signal
subplot(3, 1, 1);
stem(t, x);
title('Original Signal x[n]');
xlabel('t');
ylabel('Amplitude');
grid on;
% Plot the delayed signal
subplot(3, 1, 2);
stem(t_delayed, x_delayed);
title('Delayed Signal x[n] by 2 Samples');
xlabel('t');
ylabel('Amplitude');
grid on;
% Plot the advanced signal
subplot(3, 1, 3);
stem(t_advanced, x_advanced);
title('Advanced Signal x[n] by 3 Samples');
xlabel('t');
ylabel('Amplitude');
grid on;
% Adjust subplot spacing
sgtitle('Original Signal with its Delay and Advance');
% Ensure the plots are displayed
grid on;
% sum of the two signals x_1 and x_2
n = 0:1:5;
x_1 = zeros(size(n)); % Initialize x with zeros
x_1(n == 1) = -1; 
x_1(n == 2) = 3; 
x_2 = zeros(size(n));
x_2(n == 1) = 3; 
x_2(n == 2) = 3; 
x_2(n == 3) = 1; 
x_2(n == 4) = -2; 
% implement sum signals
x_sum = x_1 + x_2;
% plot the figure and subplot
figure;
subplot(3, 1, 1);
stem(n, x_1);
title('Signal x1');
xlabel('n');
ylabel('Amplitude');
grid on;
subplot(3, 1, 2);
stem(n, x_2);
title('Signal x2');
xlabel('n');
ylabel('Amplitude');
grid on;
subplot(3, 1, 3);
stem(n, x_sum);
title('Signal of Sum of x1 and x2');
xlabel('n');
ylabel('Amplitude');
grid on;
% test for adding two sequence
n1 = -5:5;
x1 = [1 3 0 1 5 2 1 0 3 0 1];
n2 = -3:7;
x2 = [3 2 0 1 5 1 0 2 2 4 0];
[y, nOut] = AddSeq(x1, n1, x2, n2);
% convolution part
n = -3:1:3;
x = [1 0 -1 0 1 0 -1];
h = zeros(size(n));
h(n == 0) = 1;
y1 = conv(x, h, 'same');
% Plot x[n]
subplot(3, 1, 1);
stem(n, x, 'b', 'filled');
xlabel('n');
ylabel('x[n]');
title('Input Signal x[n]');
% Plot h0[n]
subplot(3, 1, 2);
stem(n, h, 'r', 'filled');
xlabel('n');
ylabel('h[n]');
title('Impulse Response h[n]');
% Plot y[n]
subplot(3, 1, 3);
stem(n, y1, 'g', 'filled');
xlabel('n');
ylabel('y[n]');
title('Convolution Result y[n] = x[n] * h[n]');
sgtitle('x[n], h[n], and y[n]');
% Adjust the figure for better visualization
set(gcf, 'Position', [150, 150, 800, 600]);

