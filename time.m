function arrTime = time(chrForC, intName, intOrder, intBeat, intBaseFS)
%some constant here
realBaseTime = 0.6;
realStopTime = 0.1;
realBaseDelta = 2^(1.0/12);

%init
realBaseFr = 0;
ltFsDelta = [2;2;1;2;2;2;1];
if chrForC=='F'
	realBaseFr = 349.23;
elseif chrForC=='C'
	realBaseFr = 261.63;
end

%if we want a stop
if intName==0
	arrTime = zeros(1,floor(intBaseFS*realBaseTime*4/intBeat));
	return
end

%if we want the music
realMyFr = realBaseFr;
if intOrder<0
	realMyFr = realMyFr/(2^intOrder);
elseif intOrder >0
	realMyFr = realMyFr*(2^intOrder);
end

for i=1:(intName-1)
	realMyFr = realMyFr*((realBaseDelta)^(ltFsDelta(i)));
end

arrTime = ones(1,floor(intBaseFS*realBaseTime*(4/intBeat)))*realMyFr;
