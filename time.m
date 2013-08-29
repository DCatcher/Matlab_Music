function arrTime = time(chrForC, intName, intOrder, intBeat, intBaseFS)
%some constant here
realBaseTime = 0.5;
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
	arrTime = zeros(floor(intBaseFS*realStopTime));
	return
end

%if we want the music
realMyFr = realBaseFr;
if intOrder==-1
	realMyFr = realMyFr/2;
elseif intOrder == 1
	realMyFr = realMyFr*2;
end

for i=1:(intName-1)
	realMyFr = realMyFr*((realBaseDelta)^(ltFsDelta(i)));
end

arrTime = ones(floor(intBaseFS*realBaseTime*(4/intBeat)),1)*realMyFr;
