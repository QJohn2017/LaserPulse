function res = plus(pulse1, pulse2)
% PLUS calculates the sum of two pulses.
%
% INPUTS:
%   pulse1: instance of LaserPulse
%   pulse2: instance of LaserPulse
%
% OUTPUTS:
%   p: the summed pulse
%
% If the two pulses have different sampling , they are interpolated over a
% commond domain.

% Copyright (C) 2015-2017 Alberto Comin, LMU Muenchen
% This file is part of LaserPulse. See README.txt in the LaserPulse folder
% for copyright and licence notice.

res = binaryOperator(pulse1, pulse2, @polarsum);


function [amp, phase] = polarsum(amp1,phase1,amp2,phase2)
realpart = amp1 .* cos(phase1) + amp2 .* cos(phase2);
imagpart = amp1 .* sin(phase1) + amp2 .* sin(phase2);
amp = hypot(realpart, imagpart);
if pulse1.unwrapPhase 
  phase = getUnwrappedPhase(realpart +1i * imagpart);
else
  phase = atan2(imagpart, realpart);
end
end

end
