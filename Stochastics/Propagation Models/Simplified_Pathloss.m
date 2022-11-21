
function [g_simpl] = Simplified_Pathloss(d, alpha,g_0, d_0)
%   function returns signal attenuation value based on simplified path loss
%
%   Authors: Enrique Caballero
%
%      g_simpl - Simplified Path Loss
%
%      d - distance between antennas [km]  
%      d_0 - Reference distance between antennas [km]
%      g_0 - unit gain at d_0 
%      alpha -  Characterizes the environment
%           alpha = 2 Free Space
%           Urban environment 3 <= alpha => 6
%           
                g_simpl = g_0 + 10*alpha*log10(d_0/d);

end