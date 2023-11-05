function PrandtlMeyer = Nu(M)

    gamma = 1.4;
    PrandtlMeyer = sqrt((gamma+1)/(gamma-1)) .* atan(sqrt((gamma-1)/(gamma+1)) .* sqrt(M.^2-1)) - atan(sqrt(M.^2-1));
    % converting to degrees

    PrandtlMeyer = rad2deg(PrandtlMeyer);
end