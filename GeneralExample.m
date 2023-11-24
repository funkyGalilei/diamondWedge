clc,clear

%Variables and Initial Conditions
gamma = 1.4;
M1 = 3.2;
epsilon = 15;
alpha = 10;

%% COMPRESSION WAVE
if alpha < epsilon

    theta = epsilon - alpha;
    beta = deg2rad(beta(M1,theta,gamma,0));
    %Uses beta function with 0 being weak shock and 1 being strong shock,
    %input freestream mach, theta angle in degrees, and gamma value.
    %Outputs beta in degrees
    theta = deg2rad(theta);

    M1n = M1 * sin(beta); %Calculating M1n for the NSW calculation
    M2n = sqrt((2/(gamma - 1) + M1n^2) / (2*gamma*M1n^2/(gamma - 1) - 1)); %Calculating M2n using equation 8.59
    M2 = M2n/sin(beta - theta); %Calculating M2
end

%% EXPANSION WAVE
if alpha > epsilon

    theta = alpha - epsilon;
    M2 = 0; %initializing the M2 variable
    n = 1000; %number of iterations 

    Nu1 = Nu(M1); %Calculating Nu1 using the Nu function at freestream mach
    Nu2 = Nu1 + theta; %Calculating Nu2 using Nu1 and theta

    MeyerAgainstMach = PrandtlMeyer("no", n); %Outputting the corresponding mach number and Nu value

    for i = 1:n
        percentDifference = abs(Nu2 - MeyerAgainstMach(i, 2))/(Nu2)*100;

        if percentDifference < 1
            M2 = MeyerAgainstMach(i, 1);
        end
    end
end

%% NORMAL SHOCK WAVE
if alpha == epsilon
    disp('NSW')
end