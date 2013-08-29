function arrNoteBase = music_note_base(ltMusicNote)
intBaseFS = 8000;
realBaseTime = 0.6;
chrForC = 'F';
intSizeX = size(ltMusicNote);intSizeX = intSizeX(1);

intBoolFirst = 0;
arrNoteBase = [];
for i=1:intSizeX
	intNameNow = ltMusicNote(i,1);
	intBeatNow = ltMusicNote(i,2);
	intOrderNow = ltMusicNote(i,3);

	intLengthAdd = 0;
	if intBoolFirst==0
		intLengthAdd = 0;
	elseif intBoolFirst==4
		intLengthAdd = floor(intBaseFS*realBaseTime*0.1);
	elseif intBoolFirst==8
		intLengthAdd = floor(intBaseFS*realBaseTime*0.1/2);
	end
	
	intLengthTmp = intBaseFS*realBaseTime*4/intBeatNow;
	ltTime = [1:intLengthTmp]/8000;
	arrNowMusic = time_envelope(intBeatNow, intBaseFS).*sin(2*pi*time(chrForC,intNameNow,intOrderNow,intBeatNow,intBaseFS).*ltTime);
	intLengthNow = size(arrNoteBase);intLengthNow = intLengthNow(2);
	arrNoteBase = [arrNoteBase(1:(intLengthNow-intLengthAdd)),...
					arrNoteBase(intLengthNow-intLengthAdd+1:intLengthNow)+arrNowMusic(1:intLengthAdd),...
					arrNowMusic(intLengthAdd+1:intLengthTmp)];
	intBoolFirst = intBeatNow;
end
