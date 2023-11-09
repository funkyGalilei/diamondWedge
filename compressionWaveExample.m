%% Going through Example 9.11)
% use the normal shock table to get beta, the wave angle, maybe import the data and then round to
% the nearest entry - the equation contains 3 variables, so do a different
% find the normal component of Mach 1
% with Mn1 = M1sin(beta)
% approach than the expansion wave
% with this Mn1 value, we can also find p2/p1, with an eq 8.65)
% find Mn2 from Mn1 with eq 8.59)

clc
clear

gamma = 1.4;

% given values from problem:
M1 = 10;
theta = 10; % in degrees

% nevermind, this method doesn't work
% % converting units and setting up to solve for beta
% theta = 10;
% theta = deg2rad(theta);
% Mach = 10;
% 
% beta = sym('beta');
% eqn1 = tan(theta) == 2*cot(beta)* (Mach^2*sin(beta)^2 - 1)/(Mach^2*(gamma + cos(2*beta)) + 2);
% 
% solve(eqn1, beta, "ReturnConditions",true)

filename = 'thetaBetaMach.txt';
thetaBetaMach = importdata(filename);

% now that the data is imported, graph, then do regression analysis so the
% answers can be more accurate?

plot(thetaBetaMach.data(:, 3), thetaBetaMach.data(:, 2))

