function direction_field(f, xlimits, ylimits, title_text)
%% DIRECTION_FIELD plot a direction field for a first order ODE
%% Syntax: 
%    direction_field(f, limits, title_text)
%    direction_field(f, xlimits, ylimits, title_text)
%
%% Inputs:
%    f - function handle used for calculating dy/dx: dy/dx = f(x, y). f
%    must take two inputs: x and y. x and y are 2D matricies of x and y 
%    positions for each point on the grid defined by limits.
%    
%    xlimits - A vector of size 2 defining lower and upper limits for x.
%    
%    ylimits - A vector of size 2 defining lower and upper limits for y. If
%    ylimits is undefined, xlimits will be used as ylimits.
%
%    title_text - The differential equation as a string in latex format.
%    Will be printed as 'dy/dx = {title_text}'
%
%% Example:
%    direction_field(@(x, y) sin(x) + cos(y), [-2 2], [-5 5], '\sin(x) + \cos(y)')
%    direction_field(@(x, y) sin(x) + cos(y), [-5 5], '\sin(x) + \cos(y)')
%
%% See also: QUIVER
%% Author: Simon Thor
% TODO: add resolution parameter
% TODO: replace current argument validation with arguments statement
% instead.
%     arguments
%         f function_handle
%         title_text string
%         xlimits (1, 2) {mustBeNumeric}
%         ylimits (1, 2) {mustBeNumeric} = xlimits
%     end
    if nargin < 3
        error('Not enough input arguments. Function requires 3 or 4 input arguments.')
    else if nargin == 3
        title_text = ylimits;
        ylimits = xlimits;
    end
    
    [X, Y] = meshgrid(linspace(xlimits(1), xlimits(2), 20), linspace(ylimits(1), ylimits(2), 20));
    slope = f(X, Y);
    length = sqrt(1 + slope.^2);
    quiver(X, Y, 1./length, slope./length, 0.45);
    axis tight; grid on; xlabel('x'), ylabel('y')
    title(strcat('$\frac{dy}{dx} = ', title_text, '$'), 'interpreter','latex')
end