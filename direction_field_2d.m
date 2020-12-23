function direction_field_2d(F, G, xlim, ylim, res)
%DIRECTION_FIELD_2D Plot arbitrary 2D direction field
arguments
    F function_handle
    G function_handle
    xlim (1, 2) {mustBeNumeric}
    ylim (1, 2) {mustBeNumeric} = xlim
    res (1, 1) {mustBeNumeric} = 30
end

[x, y] = meshgrid(linspace(xlim(1), xlim(2), res), linspace(ylim(1), ylim(2), res));
dxdt = F(x, y);
dydt = G(x, y);
length = sqrt(dxdt.^2+dydt.^2);
quiver(x, y, dxdt./length, dydt./length)
end

