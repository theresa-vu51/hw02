function [t] = doLineSearch( objfun, xc, sdir )
%DOLINESEARCH perform backtracking linesearch subject to armijo
%condition
%
% input:
%   objfun   function handle for objective function
%   xc       current iterate
%   xp       previous iterate
%   sdir     search direction
%
% output:
%   t        lin search parameter

% evaluate objective function at current iteration
[fc, dfc] = objfun( xc );

% initialize flag
success = false;

% set max number of linesearch iterations
maxit = 24;

% set initial step size and line search parameters
t = 1.0;        %intial step size
c = 1e-4;       %search parameters
tau = 0.5;      %parameter to update t

% do linesearch
for i = 1 : maxit
    %evaluate objective function at xc + t*sdir (fn)
    [fn, dfn] = objfun (xc+t*sdir);
    if fn-fc > c*t*dfc'*sdir %if this t doesn't satisfy Armijo
        t=tau*t;             %update t, then loop back
    end    
end

%%%%%%%%%%%%%%%%%%%
%not sure what to do about the flag success
%%%%%%%%%%%%%%%%%%%

% display message to user
if ~success, disp('line search failed'); t = 0.0; end

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
