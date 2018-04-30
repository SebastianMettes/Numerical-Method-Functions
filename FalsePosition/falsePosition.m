
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter);
% falsePosition
% function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% Function to estimate the roots of a given function.
% 
%input:
% func: the function handle being evaluated, must use x as independent
% variable e.g. @(x)x^2 would be treated as f(x)=x^2
% xl: the lower boundary guess
% xu: the upper boundary guess
% es: the desired relative error, default is 0.0001%
% maxiter: the maximum number of iterations desired (default 200)
%
%output:
% root: the estimated root location
% fx: the function evaluated at the root location
% ea: the approximate relative error (%)
% iter: how many iterations were performed

%Check that the function was input with the correct format:
if(strcmp(class(func), 'function_handle')~=1)
    error("You must specify a function handle as the argument for func, example: @(x)x^2")
end

%Check number of function inputs and outputs, set defaults if needed: 
if nargin < 3 || nargin > 5
    error('You must have between 3 and 5 input arguments');
elseif nargin == 3
    es = 0.0001;
    maxiter = 200;
elseif nargin == 4
    maxiter = 200;
end

% change to long format
format long

%Calculate Function value at xl, xu
lb = func(xl); %lower bound
ub = func(xu); %upper bound

if lb==0 || ub==0
    disp('you guessed the root, it is one of your bounds')
    return
end

%Check if F(xl) has opposite sign of (F(xu))

if ~(sign(lb)<sign(ub) || sign(ub)<sign(lb))
    error('Your bounds are not on opposite sides of the root, try widening your bounds, or make sure your function actually crosses Y = 0 in the XY plane')
end
    
%set error, iter, xrold and xrnew to an initial value to start loop below
err = 100;
iter=0;
xrnew = 0;
%Create a while loop 
while err >= es && iter < maxiter
%Store previous root:
    xrold=xrnew;
%Create new root
    xrnew = xu-(func(xu)*(xl-xu))/(func(xl)-func(xu));
%Check if new root is above or below 0 
    if sign(func(xrnew))<0
        xl=xrnew;
    elseif sign(func(xrnew))>0
        xu=xrnew;
    else
        root = xrnew;
        root
        ea =0;
        ea
        fx =0;
        fx
        iter
        disp('You found the exact root!')
        return    
        
    end
    
%Calculate Approximate Percent Error
    if iter>=1
    err = abs((xrnew-xrold)/xrnew)*100;
    end
    iter = iter+1;
    
    
end

% set variables for output
root = xrnew;
fx = func(xrnew);
ea = err;
iter=iter;

% print information useful to user.
fprintf('\n Calculated Root is %d\n',root)
fprintf(' Func(root) = %d\n', fx)
fprintf(' Approximate Error is %d\n',ea)
fprintf(' The computer did %d iterations to reach this number.\n',iter)

end

    



