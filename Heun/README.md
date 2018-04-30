## Heun.m
Heun.m - matlab file for improved Euler's, or Heun's method.
# function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
Function to calculate the numerical solution to the differential equation
dydt, over the span tspan, with an initial condition y0, and step size h.
ES and Maxit are optional and default to 0.001 and 50. es and maxit refer
to the stopping criterion and maximum number of iteration, respsectively,
for the iterations involving the predictor-corrector.

# Inputs
dydt = function example: dydt = @(t,y) y^2+t... etc


tspan = [left, right] were left and right are the end points of the span of t.


y0 = value of the function associated with tspan(1) or tspan(left).


h = step size


es = target relative error value


maxit = maximum iterations to achieve relative error value. If Maxit is achieved before es, continue to next h value.

# Outputs
t = t vector of values corresponding to step size


y = y vector of values of y associated with corresponding t value.
