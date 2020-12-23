function solutions = matrix_ode_solver(M, simplifySetting, initialIn, initialOut)
%MATRIC_ODE_DOLVER Solves system of ODEs
    arguments
        M {mustBeNumeric}
        simplifySetting logical = false
        initialIn {mustBeNumeric} = nan
        initialOut (2, 1) {mustBeNumeric} = [nan;nan]
    end
    rows = size(M, 1);
    syms x(t) [rows 1]

    if isnan(initialIn)
        solutions = dsolve(diff(x) == M*x);
    else
        solutions = dsolve(diff(x) == M*x, x(initialIn) == initialOut);
    end
    
    if simplifySetting
        sol_func_names = fieldnames(solutions);
        for i=1:length(sol_func_names)
            solutions.(sol_func_names{i}) = simplify(solutions.(sol_func_names{i}));
    end
end

