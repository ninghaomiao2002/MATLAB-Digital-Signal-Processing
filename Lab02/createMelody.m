%% createMelody Function
function y = createMelody(d_vect, note_vect, fs)
    % Initialize an empty vector
    y = []; 
    disp(length(note_vect));
    for i = 1:length(note_vect)
        note = note_vect(i);
        duration = d_vect(i);
        % Generate the note and concatenate it to the melody
        % Using the createNote function
        [note_signal, ~] = createNote(duration, note, fs); 
        % Return y values
        y = [y, note_signal];
    end
end