# falsePosition
Function to estimate the roots of a given function.
## function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
### input:
* func: the function handle being evaluated must use x as independent variable e.g. @(x)x^2 would be treated as f(x)=x^2
* xl: the lower boundary guess
* xu: the upper boundary guess
* es: the desired relative error, default is 0.0001%
* maxiter: the maximum number of iterations desired (default 200)

### output:
* root: the estimated root location
* fx: the function evaluated at the root location
* ea: the approximate relative error (%)
* iter: how many iterations were performed
