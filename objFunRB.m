function [f, df, d2f] = objFunRB( x, a )
%OBJFUNRB implementation of rosenbrock objective function
%
% inputs:
%    x         current iterate (2 x 1 vector)
%    a         constants
%
% outputs:
%    f         objective value
%    df        gradient
%    d2f       hessian

if nargin < 1, runSelfTest(); return; end

% define default constants
if nargin < 2, a = [1; 100]; end

% evaluate objective function
% f(x) = (a_1 - x_1)^2 + a_2(x_2 - x_1^2)^2.
f = (a(1)-x(1))^2+a(2)*(x(2)-x(1)^2)^2;

% evaluate gradient of f(x)
if nargout > 1
    df = [-2*(a(1)-x(1))-4*a(2)*x(1)*(x(2)-x(1)^2); 2*a(2)*(x(2)-x(1)^2)];
end

% evaluate hessian matrix of f(x)
if nargout > 1
    d2f = [2 - 4*x(2)*a(2) + 12*a(2)*x(1)^2, -4*x(1)*a(2); -4*x(1)*a(2), 2*a(2)];
end

end % end of function




%//////////////////////////////////////////////////////
function runSelfTest()

% construct solution
x0 = rand( 2, 1 );

% define function handle for objective function
objfun = @(x) objFunRB( x );

% perform derivative check
checkDerivative( objfun, x0 );

end % end function
%//////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
