clear
ltMusicNote = [3,4,0;3,4,0;4,4,0;5,4,0;5,4,0;5,8,0;4,8,0;3,4,0;2,4,0;1,4,0;1,4,0;2,4,0;3,4,0;3,4,0;3,8,0;2,8,0;2,2,0];
intBaseFS = 8000;
test_arr = music_note_base(ltMusicNote);
sound(test_arr,intBaseFS);
