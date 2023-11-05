% inputs: output is whether to output graph
% n is for how many entries in the matrix to calculate

% clear
function generalPradtlMeyer = PrandtlMeyer(output, n)

%     n = 100;
    % an expansion wave can't happen subsonically!
    % so the Mach numbers would start at ONE, not zero
    M = linspace(1, 20, n);
    MeyerAngles = zeros(1, n);

    for i = 1:n
        MeyerAngles(1, i) = Nu(M(i));
    end
    
    generalPradtlMeyer = [M.', MeyerAngles.'];

    if strcmp(output, "yes")
        figure(1)
        plot(M, MeyerAngles(1, :), LineWidth=3)
        xlabel("Mach Number [unitless]")
        ylabel("Prandtl-Meyer Angle [degrees]")
        grid on
        title("Prandtl-Meyer Angle Variation Relative to Mach Number" + newline + "at a Gamma of 1.4")
        axis([1, 20, 0, 120])
    end
end
