%% Section 1: COST MODEL Evaluation with distance and frequency
%   This part of the script returns signal attenuation parameterized
%    with distance and frequency based on COST231-Hata Model
%
%   Authors: Enrique Caballero

clear all;
close all;
clc;
mW2dBm = @(mW) 10*log10(mW);               % dBm As A Function Of Power In milliWatts
W2dBW = @(W) 10*log10(W);               % dBW As A Function Of Power In Watts

dBW2W = @(dBW) 10^(dBW/10);


%      f - frequency [MHz]
%           UMTS= 2000 MHz

f = 2000; 


% Transmission Power
% Pt = 20W

p_t = 20;

p_t_dbm = mW2dBm(p_t);

%      d - distance between antennas [km]
%           d = 2 km

d = 2; 

%      d_0 - Reference distance [km]
%           d_0 = 10 m

d_0 = 10e-3; 

% Free Space Path Loss 
% g_0 at d_0
g_0 = -FreeSpace(d_0,f); % Notice negative of the gain to convert it into a loss

%      alpha -  Characterizes the environment
%           alpha = 2 -> Free Space
%           3 <= alpha => 6  -> Urban environment
%           alpha = 3.5

alpha = 3.5;

% Outage probability Q
% 2% threshold
Q =  0.02;

P = 1 - Q;

g_path = Simplified_Pathloss(d,alpha,g_0,d_0); 
p_bar = 10^(g_path/10)*p_t;
sensitivity = -log(P)*p_bar;
sensitivity_dbm = mW2dBm(sensitivity*1e3);
fprintf('Minimum Sensitivity is %0.02f fW \n This is %0.02f dBm \n',(sensitivity*1e15),mW2dBm(sensitivity*1e3))


%% Nakagami Distribution

m = 0.8;
mu_nakagami = p_bar;
omega_nakagami = p_bar^2/m;

sensitivity_nakagami = makedist("Nakagami","mu",mu_nakagami,"omega",omega_nakagami);

gamma_nakagami = gamma(m);
factor_nakagaminc = m/p_bar;


gammainc_nakagami = gammainc(m,factor_nakagaminc*sensitivity);

reception_probability = gammainc_nakagami  /  gamma_nakagami;

fprintf('Reception Probability with Nakagami model is %0.02f .  \n We need to decrease it \n',reception_probability)









