function [y, nOut] = AddSeq(x1, n1, x2, n2)
    % Calculate the sum of the input sequences
    % we need make sure that they have the same length
    nMin = min(min(n1), min(n2));
    nMax = max(max(n1), max(n2));
    nOut = nMin:1:nMax;
    y1 = zeros(size(nOut));
    y2 = zeros(size(nOut));
    % Map x1 and x2 to their corresponding positions in the output sequence
    y1(n1 - nMin + 1) = x1;
    y2(n2 - nMin + 1) = x2;
    % Calculate the sum of the sequences
    y = y1 + y2;
    % Plot the input sequences and the output
    % set up xlabels and ylabels
    figure;
    subplot(3, 1, 1);
    stem(n1, x1, 'r', 'filled');
    xlabel('Time(nOut)');
    ylabel('Amplitude');
    title('Input Sequence 1');
    subplot(3, 1, 2);
    stem(n2, x2, 'b', 'filled');
    xlabel('Time(nOut)');
    ylabel('Amplitude');
    title('Input Sequence 2');
    subplot(3, 1, 3);
    stem(nOut, y, 'g', 'filled');
    xlabel('Time(nOut)');
    ylabel('Amplitude');
    title('Sum of Sequences');
    sgtitle('Input Sequences and Sum');

end