
function [g_free] = FreeSpace(d,f)
%   function returns signal gain value based on free space path loss
%
%   Authors: Enrique Caballero
%
%      g_free -Free Space  Gain [dB]
%
%      d - distance between antennas [km]
%      f - frequency [MHz]
%
c = 3e5; % km/s
g_free = 20*log10( (4*pi*d*(f*1e6)) / c );

end