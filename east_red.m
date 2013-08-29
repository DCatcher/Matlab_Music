clear
ltMusicNote = [5,4,0;5,8,0;6,8,0;2,2,0;1,4,0;1,8,0;6,8,-1;2,2,0];
intBaseFS = 8000;
test_arr = music_note_base(ltMusicNote);
sound(test_arr,intBaseFS);

