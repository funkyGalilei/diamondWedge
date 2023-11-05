%% Expansion Wave process:
% find Nu(M1) from Nu function 9.42)
% find Nu2 with known value of theta with theta = Nu2 - Nu1 9.43)
% find M2 from Nu2 (going backwards) from Appendix C
% find ratio between downstream pressure and upstream pressure with
% function and eq 9.45)

clear

%% solving Example 9.9 in the book first:
% given M1 = 1.5, p1 = 1 atm, and T1 = 288K, theta = 15 degrees

gamma = 1.4;
theta = 15;
M1 = 1.5;
Nu1 = Nu(M1); % the function Nu outputs numbers in degrees
Nu2 = Nu1 + theta;
% now need a way to round this value to the nearest value in the
% PrandtlMeyerAngles matrix and find it's adjacent Mach number value
n = 200; % number of entries to calculate in MeyerAgainstMach

MeyerAgainstMach = PrandtlMeyer("yes", n); % second column is the angles, first is M

% comparing the value Nu2 to the values in the second column of above func
% to get M2 - within a certain percent, do it manually
M2 = 0;

for i = 1:n
    % a bunch of percent difference math here, with an output of BOOL, so the if 
    % statement can just take that
    percentDifference = abs(Nu2 - MeyerAgainstMach(i, 2))/(Nu2)*100;
    
     if percentDifference < 10
        M2 = MeyerAgainstMach(i, 1);
        % very likely to have two or multiple values within this range, so
        % displaying closest matrix entries for understanding
        disp(MeyerAgainstMach(i, 1))
    end
end

% this is eq 9.45, used to find the ratio between downstream pressure and
% the freestream pressure
P2overP1 = ((1 + ((gamma-1)/2) * M1^2)  /  (1 + ((gamma-1)/2) * M2^2))^(gamma/(gamma-1));
