% no longer needed, code is fully written out in generalExample.m

function pressureRatio = expansionWave(M1, theta, gamma, n)
    Nu1 = Nu(M1); % the function Nu outputs numbers in degrees
    Nu2 = Nu1 + theta;

    MeyerAgainstMach = PrandtlMeyer("yes", n); % second column is the angles, first is M

    M2 = 0;
    assigned = 0;
    
    for i = 1:n
        percentDifference = abs(Nu2 - MeyerAgainstMach(i, 2))/(Nu2)*100;
        boolValue = percentDifference < 10;
    
         if boolValue
            M2 = MeyerAgainstMach(i, 1);
            disp("percent difference value that works:")
            disp(MeyerAgainstMach(i, 1))    
            assigned = 1;
        end
    end
    
    if assigned == 0
        disp("no value is assigned to M2, percent difference")
    end
    pressureRatio = ((1 + ((gamma-1)/2) * M1^2)  /  (1 + ((gamma-1)/2) * M2^2))^(gamma/(gamma-1));

end