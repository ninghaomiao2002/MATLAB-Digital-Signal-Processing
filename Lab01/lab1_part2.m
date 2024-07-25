%set up duration and frequencies
d = 2;
f0 = 300:300:1200;
fs = 8000;
figure;
for i = 1:length(f0)
  f0_values = f0(i);
  T0 = 1/f0_values;
  t = 0:(4*T0/fs):(4*T0);
  x = sin(2*pi*f0_values*t);
  %sound(x, f0_values);
  subplot(length(f0), 1,i);
  stem(t,x,'o','DisplayName',['f0=' num2str(f0_values) ' Hz'])
  title(['Sampled Signal for f0=' num2str(f0_values) ' Hz']);
  xlabel('t(s)');
  ylabel('Amplitude');
  % xlim([0  1]);
  % ylim([-1 1]);
  grid on;
  legend;
end
% Original Signal
fs = 8000;
f0 = 800;
T0 = 1/f0;
t = 0:(4*T0/fs):(4*T0);
x = sin(2*pi*f0*t);
delay_seconds = 2;
delay_samples = round(delay_seconds*fs);
delayed_signal = sin(2*pi*f0*(t-delay_seconds));
% plot and subplot the figures
figure;
subplot(2,1,1);
stem(t,x,'b','DisplayName','Original Signal x[n]', 'Linewidth',1);
title('Original Signal');
xlabel('t/Seconds');
ylabel('Amplitude');
grid on;
legend;
subplot(2,1,2);
stem(t,delayed_signal,'r','DisplayName','Delayed Signal x[n-2]', 'Linewidth',1);
title('Delayed Signal x[n-2]');
xlabel('t/Seconds');
ylabel('Amplitude');
grid on;
legend;
% Constants
fs = 8000;   
f0_x = 800;  
f0_y = 400;  
d_x = 2;     
d_y2 = 4;    
d_y3 = 2;    
% Create time vectors
t_x = (0:(fs*d_x)-1) / fs;
t_y2 = (0:(fs*d_y2)-1) / fs;
t_y3 = (1:(fs*d_y3)-1) / fs;
% Generate signals for x, y1, y2 and y3
x = sin(2*pi*f0_x*t_x);
y1 = sin(2*pi*f0_y*t_x);
y2 = sin(2*pi*f0_y*t_y2);
y3 = sin(2*pi*f0_y*t_y3);
% make them to the same length
x = [x zeros(1,32000-length(t_x))];
y1 = [y1 zeros(1,32000-length(t_x))];
y2 = [y2 zeros(1,32000-length(t_y2))];
y3 = [zeros(1,24000-length(t_y3)),y3];
y3 = [y3 zeros(1,23999-length(t_y3))];
%convolution part
y1_conv = conv(x, y1, 'same');
y2_conv = conv(x, y2, 'same');
y3_conv = conv(x, y3, 'same');
% Plot Signal x+y1
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y1, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Signal y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x+y1, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Signal x+y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Signal x+y2
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
hold on;
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y2, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Signal y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x+y2, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Signal x+y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Signal x+y3
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 2, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y3, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Signal y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x+y3, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Signal x+y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Signal x*y1
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y1, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Signal y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x.*y1, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Signal x*y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Signal x*y2
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
hold on;
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y2, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Signal y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x.*y2, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Signal x*y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Signal x*y3
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 2, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y3, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Signal y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, x.*y3, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Signal x*y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Convolve Signal x and y1
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y1, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Signal y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, y1_conv, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
title('Convolve Signal x and y1');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Convolve Signal x and y2
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 0.1, 'DisplayName', 'x(t)');
hold on;
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y2, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Signal y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, y2_conv, 'r', 'LineWidth', 0.1, 'DisplayName', 'y1(t)');
hold on;
title('Convolve Signal x and y2');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Plot Convolve Signal x and y3
figure;
subplot(3,1,1);
stem(t_y2, x, 'b', 'LineWidth', 2, 'DisplayName', 'x(t)');
title('Signal x');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
stem(t_y2, y3, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Signal y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
stem(t_y2, y3_conv, 'r', 'LineWidth', 2, 'DisplayName', 'y1(t)');
title('Convolve Signal x and y3');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;






