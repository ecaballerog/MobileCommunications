function [LHataDB] = Losscost231hata(ht, hr, f, d)
%   function returns signal attenuation value based on COST231-Hata Model
%
%   Authors: Enrique Caballero, Karol xxx
%   LHatadB = Losscost231hata(hBS, hMS, f, d, area)
%
%      LHatadB - radio signal attenuation [dB]
%
%      ht - physical height of the transmitting base station [m]
%           30 <= ht <= 200 m
%      hr -  physical height of the receiving device [m]
%           1 <= hr <= 10 m
%      f - frequency [MHz]
%           1500 <= f <= 2000 MHz
%      d - distance between antennas  [km]
%           1 <= d <= 20 km




if((min(f)>=1500)&&(max(f)<=2000))
    if((min(ht)>=30)&&(max(ht)<=200))
        if((min(hr)>=1)&&(max(hr)<=10))

            if((min(d)>=1)&&(max(d)<=20))


                LHataDB = 45.5 + 35.46 * log10(f) - 13.82 * log10(ht) - (1.1 * log10(f)-0.7)*hr + (44.9 - 6.55 * log10(ht)) * log10(d);


            else
                disp('Please Enter distance between antennas = 1 <= d <= 20 km');
            end
        else
            disp('Please Enterphysical height of the receiving device = 1 <= hr <= 10 m');
        end
    else
        disp('Please Enter physical height of the transmitting base station = 30 <= ht <= 200 m');
    end
else
    disp('Please Enter a frequency = 1500 <= f <= 2000 MHz');
end

end