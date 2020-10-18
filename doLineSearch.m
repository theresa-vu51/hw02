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

% initialize flag
success = false;

% set max number of linesearch iterations
maxit = 24;

% set initial step size and line search parameters
t = 1.0;        %intial step size
c = 1e-4;     %search parameters
tau = 0.5;      %parameter to update t
k=0;            
xp = zeros(size(xc)); %parameter to update x

% evaluate objective function at current iteration
[f_k, df_k] = objfun( xc );

% do linesearch
for i = 1 : maxit
    %get search direction
    %s_k = getSearchDirection(objfun, x_k, g_k);
    s_k = -df_k; %setting step size to be equal to negative gradient
    
    %find step length t_k
    x_temp = x_k +t*s_k;
    f_temp = objfcn(x_temp); %f(x_k + t*s_k)
    bound = c*t*df_k*s_k;  %c*t*grad(f(x_k))*s_k
    
    if ftemp - f_k > bound %if this t doesn't satisfy Armijo
        t=tau*t;             %update t, then loop back
    end    
    
    if t==0
        break;
    else
    
    %evaluate objective function at xc + t*sdir (fn)
    [f_k, df_k] = objfun (xc+t*sdir);
    
    
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
