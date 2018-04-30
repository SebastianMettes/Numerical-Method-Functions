function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Heun
%function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Function to calculate the numerical solution to the differential equation
%dydt, over the span tspan, with an initial ocndition y0, and step size h.
%ES and Maxit are optional and default to 0.001 and 50. es and maxit refer
%to the stopping criterion and maximum number of iteration, respsectively,
%for the iterations involving the predictor-corrector.
%
%Inputs
%dydt = function example: dydt = @(t,y) y^2+t... etc
%tspan = [left, right] were left and right are the end points of the span
%of t.
%y0 = value of the function associated with tspan(1) or tspan(left).
%h = step size
%es = target relative error value
%maxit = maximum iterations to achieve relative error value. If Maxit is
%achieved before es, continue to next h value.
%
%Outputs
%t = t vector of values corresponding to step size
%y = y vector of values of y associated with corresponding t value.

%check for 3 or fewer inputs
if nargin <=3
    error('You must have at least 4 input arguments')
end
%check for 4 input variables
if nargin == 4
    es = 0.001;
    maxit = 50;
end

%check for 5 inputs
if nargin == 5
    maxit = 50;
end

%figure out if tspan is exact or if the tail of dydt needs to have a custom
%parameterization.

if mod ((tspan(2) - tspan(1)),1) ~= 0  
    
    rows = floor(tspan(2) - tspan(1))/h +2;
else
    rows = (tspan(2) - tspan(1))/h +1 ;
end
%create a t array of zeros
t = zeros(rows,1);
%fill in t array:
c=2;
t(1) = tspan(1);

while c<numel(t)
    t(c) = t(c-1)+h;
    c=c+1;
end
t(c) = tspan(2);




%create two counters:
i = 0;
j = 0;
%create the initial improved slope line

%initialize y vector and err value.
y = zeros(numel(t),1);
y(1) = y0;


while j<numel(y)- 1
%initialize error value, counter, and h value
err = 10;
i=0;
h = t(2+j) - t(1+j);
%initial "slope right"
sloperight = dydt(t(j+2), y(j+1)+h*dydt(t(j+1),y(j+1)));
slopeleft = dydt(t(1+j),y(1+j));


%do Magic: 
while  i < maxit && err >= es
    %yA is the y value based on previous slope right
   yA = y(j+1)+h*sloperight;        
   slopenew = 0.5*(slopeleft+sloperight);
   %yB is the y value based on the improved slope calculation
   yB = y(j+1)+h*slopenew;
   err = abs((yB - yA))/yB;
   %Create a new slope right based on yB (for the next iteration).
   sloperight = dydt(t(j+2),yB);
   i=i+1;
   
   
end

y(2+j) = yB;
j = j+1;

end

t;
y
plot (t,y)
title('t vs y for differential equation')
xlabel('t')
ylabel('y')








