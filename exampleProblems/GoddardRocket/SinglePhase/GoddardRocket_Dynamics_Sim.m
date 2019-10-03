
function [dx] = GoddardRocket_Dynamics_Sim(x,u,p,t,vdat)
% Goddard Rocket Dynamics - Simulation
%
% Syntax:  
%          [dx] = Dynamics(x,u,p,t,vdat)
% 
% Inputs:
%    x  - state vector
%    u  - input
%    p  - parameter
%    t  - time
%    vdat - structured variable containing the values of additional data used inside
%          the function%      
% Output:
%    dx - time derivative of x
%
% Copyright (C) 2019 Yuanbo Nie, Omar Faqir, and Eric Kerrigan. All Rights Reserved.
% The contribution of Paola Falugi, Eric Kerrigan and Eugene van Wyk for the work on ICLOCS Version 1 (2010) is kindly acknowledged.
% This code is published under the MIT License.
% Department of Aeronautics and Department of Electrical and Electronic Engineering,
% Imperial College London London  England, UK 
% ICLOCS (Imperial College London Optimal Control) Version 2.5 
% 1 Aug 2019
% iclocs@imperial.ac.uk
%
%------------- BEGIN CODE --------------

H = vdat.H; 
D0 = vdat.D0; 
grav = vdat.grav; 
c = vdat.c; 

h = x(:,1);
v = x(:,2);
m = x(:,3);
T = u(:,1);

dh=v;
dv=1./m.*(T-D0.*v.^2.*exp(-h./H))-grav;
dm=-T./c;

dx=[dh,dv,dm];


%------------- END OF CODE --------------