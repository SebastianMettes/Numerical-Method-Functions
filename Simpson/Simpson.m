function [I] = Simpson(x,y)
%% Simpson
% function I = Simpson(x,y)
% Function to integrate experimental data using the Simpson's 1/3 rule. 
% notes: independent variable must be equally spaced (i.e. 1,3,5... or
% 1,2,3...). independent variable must have equal number of dependent
% variable (y) data points.
%
%input:
% x: a vector containing all independent variable data points.
% y: a vector containing all dependent variable data points.
% 
%output:
% I: the integral of the points based on simpson's 1/3 rule.
%



%error check that inputs are the same length
Lx=length(x);
Ly=length(y);
if Lx~=Ly
    error('Your x and y vectors are not the same length!');
end

%error check that x inputs are equally spaced
spacevec=zeros(1,Lx-1);
for i= 2 : Lx
    
    spacevec(i-1)=x(i)- x(i-1);
    
end

for c = 1:Lx-2
    if spacevec(c)~=spacevec(c+1);
        error('Your X values are not equally spaced')
    end
end


%warn the user if the trapezoidal rule has to be used on the last interval

if mod(Lx,2) == 0
    warning('You have an even number of x datapoints, trapezoidal calculation will be used on the last interval');
    offset = 1;
    %create trap arrays
    trax = [x(Lx-1),x(Lx)];
    tray = [y(Lx-1),y(Lx)];
else
    trax = [0 1];
    tray = [0 0];
    offset = 0;
    
end

%Calculate value of h:
h = 1/((Lx-1-offset))*(x(Lx-offset) - x(1));

%Add up all internal points
internal = 0;
internalEven=0;
internalOdd=0;
if Lx>4
for i = 2:2:(Lx-1-offset)
    internalEven = internalEven+y(i);
end
for i = 3:2:(Lx-1-offset)
    internalOdd = internalOdd+y(i);
end
internal = 4*internalEven + 2*internalOdd;
else
    internal = y(2);
end




%Calculate simpson's 1/3:

I = h/3*(y(1)+internal+y(Lx-offset))+trapz(trax,tray);













