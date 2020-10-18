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
t_p = 1.0;        %intial step size
c = 1e-4;     %search parameters
tau = 0.5;      %parameter to update t

% evaluate objective function at current iteration
[f_k, df_k] = objfun( xc );

% do linesearch
for i = 1 : maxit
    
    %find step length t_k
    x_temp = xc +t_p*sdir;
    f_temp = objfcn(x_temp); %f(x_k + t*s_k)
    bound = c*t_p*df_k*sdir;  %c*t*grad(f(x_k))*s_k
    
    if ftemp - f_k > bound %if this t doesn't satisfy Armijo
        t_p=tau*t_p;             %update t, then loop back
    end
    
end

t=t_p;


% while flag == false
%     %find step length t_k
%     x_temp = x_k +t_p*sdir;
%     f_temp = objfcn(x_temp); %f(x_k + t_p*s_k)
%     bound = c*t_p*df_k*sdir;  %c*t*grad(f(x_k))*s_k
%     
%     if ftemp - f_k > bound %if this t doesn't satisfy Armijo
%         t=tau*t;             %update t, then loop back
%     elseif ftemp - f_k < bound
%         flag = true;
%     end
% end

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
