function matrix_direction_field(M, xlimits, ylimits, res, title_text)
% MATRIX_DIRECTION_FIELD plot a direction field of a system of differential
% equations.
    arguments
        M (2, 2) {mustBeNumeric}
        xlimits (1, 2) {mustBeNumeric}
        ylimits (1, 2) {mustBeNumeric} = xlimits
        res {mustBeInteger} = 20
        title_text string = join(["$\frac{d\vec{x}}{dt} = " matrix2str(M) "\cdot\vec{x}$"])
    end
    [X, Y] = meshgrid(linspace(xlimits(1), xlimits(2), res), linspace(ylimits(1), ylimits(2), res));
    pos = [reshape(X, 1, []); reshape(Y, 1, [])];
    vec = M * pos;
    square_vec = reshape(vec(1, :), res, []);
    square_vec(:, :, 2) = reshape(vec(2, :), res, []);
    vec_length = sqrt(square_vec(:, :, 1).^2 + square_vec(:, :, 2).^2);
    quiver(X, Y, square_vec(:, :, 1)./vec_length, square_vec(:, :, 2)./vec_length);
    axis tight; grid on; xlabel('x'), ylabel('y');
    title(title_text, 'interpreter','latex');
end

