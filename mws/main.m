
clear all;

%      ht - effective base station antenna height [m]
%           30 <= ht <= 200 m
ht = 50; %[m]

%      hr - mobile station antenna height [m]
%           1 <= hr <= 10 m
hr = 2; %[m]

%      f - frequency [MHz]
%           1500 <= f <= 2000 MHz
f = 2000; %[MHz]

%      d - distance between antennas [km]
%           1 <= d <= 20 km
from = 1; %[km]
to = 20; %[km]
precision = 0.01; %[km]
d = from:precision:to; %[km]


%   hL50dB = cost231hata(hBSef, hMS, f, d, area)
L = Losscost231hata(ht, hr, f, d);

clf reset;
plot(d, L,'-');
desc = ['ht = ',num2str(ht),' [m]   hr = ',num2str(hr),' [m]   f = ',...
    num2str(f),' [MHz]   d = ',num2str(from),'-',num2str(to),' [km]  '];
annotation('textbox',[0.15 0.7 0.2 0.2],'String',{desc},'FitBoxToText','on');
grid on;
axis auto;
title({'d - distance between antennas [km] / L - radio signal attenuation [dB]';...
    'attenuation value based on COST231-Hata Model'});
xlabel('d [km]');
ylabel('L [dB]');
