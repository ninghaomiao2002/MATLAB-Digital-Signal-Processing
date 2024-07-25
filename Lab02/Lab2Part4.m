%% 1.5.1 upsample for note 60 with factor 2 and 4
% Set up parameters
fs = 8000;
% Set up notes
note1 = 60;
% Set up duration
duration1 = 2;
% Upsample the signal by a factor of 2
[x1, t1] = createNote(duration1, note1, fs);
% Set up two Values for L for testing
L1 = 2; L2 = 4;
% Creat an 0 array for the extended length
y1 = zeros(1, L1*length(x1));
% Move the values with a L interval to the array
y1(1:L1:length(y1)) = x1;
% Plotting the signals
figure;
% Using subplot to compare
subplot(3, 1, 1);
% Stem function
stem(t1, x1);
% Add a title
title(['Original Signal Note ' num2str(note1) '']);
% Set x-axia label
xlabel('Time');
% Set x-axia limit to have a better graph
xlim([0, 0.1]);
% Set y-axia label
ylabel('Amplitude');
% Sound function to listen
sound(x1, fs);
% Add a pause for the sound
pause(4);
% Sample time function for upsampled signal
t_upsampled_1 = (0:length(y1)-1)/(fs*L1);
% Using subplot to compare
subplot(3, 1, 2);
% Stem function
stem(t_upsampled_1, y1);
% Add a title
title(['Upsample Signal Note ' num2str(note1) ' with Upsample Factor ' num2str(L1) '']);
% Set x-axis label
xlabel('Time');
% Set a limit to have better graph
xlim([0, 0.1]);
% Set y-axis label
ylabel('Amplitude');
% Listen the sound
sound(y1, fs*L1);
% Add a pause for the sound
pause(4);
% Creat an 0 array for the extended length
y1 = zeros(1, L2*length(x1));
% Move the values with a L interval to the array
y1(1:L2:length(y1)) = x1;
% Sample time function for upsampled signal
t_upsampled_2 = (0:length(y1)-1)/(fs*L2);
subplot(3, 1, 3);
stem(t_upsampled_2, y1);
title(['Upsample Signal Note ' num2str(note1) ' with Upsample Factor ' num2str(L2) '']);
% Set x-axis label
xlabel('Time');
% Set a limit to have better graph
xlim([0, 0.1]);
% Set y-axis label
ylabel('Amplitude');
% Listen the sound
sound(y1, fs*L1);
% Add a pause for the sound
pause(4);

%% 1.5.2 upsample for handel.wav
load handel.mat
filename = 'handel.wav';
[y, Fs] = audioread('handel.wav');
L = [1,2,4,8,10];
figure;
% duration1 = 2;
for i = 1:length(L)
    x = zeros(1, L(i)*length(y));
    x(1:L(i):length(x)) = y;
    % Plotting the signals
    t = (0:L(i)*length(y)-1)/Fs;
    subplot(length(L)+1, 1, i+1);
    % plot(t, x);
    stem((0:length(x)-1)/(Fs*L(i)),x);
    title(['Signal with Upsample factor ' num2str(L(i)) '']);
    % Set x-axis label
    xlabel('Time');
    % Set a limit to have better graph
    xlim([0.25, 0.3]);
    % Set y-axis label
    ylabel('Amplitude');
    % Listen the sound
    sound(x, Fs*L(i));
    % Add a pause for the sound
    pause(1+length(x)/(Fs*L(i)));
    % Save audio as files
    audiowrite(['handel Audio with Upsample by factor_' num2str(L(i)) '.wav'], x, Fs*L(i));
end
