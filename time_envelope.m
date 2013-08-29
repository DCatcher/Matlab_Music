function arrTimeEn = envelope(intBeat, intBaseFS)
%some constant here
intPeak = 100;
intMiddle = 92;
realToPeakTime = 0.3;
realPeakToMiddleTime = 0.2;
realMiddleKeepTime = 0.5;
realMiddleToNoneTime = 0.5;
realBaseTime = 0.4;

%generate the arr
realTimeLength = realBaseTime*intBaseFS*4/intBeat;
intToPeakLength = floor(realTimeLength*realToPeakTime);
intPeakToMiddleLength = floor(realTimeLength*realPeakToMiddleTime);
intMiddleKeepLength = floor(realTimeLength*realMiddleKeepTime);
intMiddleToNoneLength = floor(realTimeLength*realMiddleToNoneTime);

arrTimeEn = linspace(0,intPeak,intToPeakLength+1);arrTimeEn(end)=[];
arrTimeEn = [arrTimeEn, linspace(intPeak,intMiddle,intPeakToMiddleLength+1)];
arrTimeEn = [arrTimeEn, linspace(intMiddle,intMiddle,intMiddleKeepLength+1)];
arrTimeEn = [arrTimeEn, linspace(intMiddle,0,intMiddleToNoneLength)];
arrTimeEn = exp(arrTimeEn/intPeak*log(intPeak))/intPeak;
arrTimeEn = arrTimeEn(1:(4/intBeat*intBaseFS*realBaseTime*(realToPeakTime+realPeakToMiddleTime+realMiddleKeepTime+realMiddleToNoneTime)));
