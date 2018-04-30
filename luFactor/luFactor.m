function[L,U,P] = luFactor(A);
% luFactor
%function [L,U,P] = luFactor(A)
%Function to calculate the LU factorization given a square matrix. Partial
%pivoting of rows is used. 
%Note: To see results you must type  [L,U,P] = luFactor(A)
%input:
%A: input square matrix. 
%
%output:
%L = lower triangular matrix
%U = upper triangular matrix
%P = pivot matrix

%Check number of inputs:

if nargin < 1 || nargin > 1
    error('You may only have 1 input argument!');
end

%Determine how many rows and columns in matrix
[m,n] = size(A);

%Check if A is a square matrix
if (m ~= n) 
    error('Your Matrix is not a square! Please try again');
end

%Create P Matrix
P = eye(m); %eye is a diagonal ones matrix

%Create L Matrix: :note, matrix is made of zeros, diagonal ones added at
%end of function
L = zeros(m);

%Create U Matrix:
U = A;

%set counters
c=1; %represents columns
r=1; %represents rows 

%enter Pivot Loop:  
while c<=n
  
    while r<=m
        
        B = abs(U(c,c)); %Set B equal to pivot element, compare against other elements in column.
        
        if B<U(r,c)
            
            %Pivot U Matrix Rows
            temp = U(r,:);
            U(r,:) = U(c,:); 
            U(c,:) = temp;
            
            %Pivot P matrix Rows
            temp2 = P(r,:);
            P(r,:) = P(c,:);
            P(c,:) = temp2; 
            
            %Pivot L matrix non '1' rows
            temp3 = L(r,:);
            L(r,:)=L(c,:);
            L(c,:) = temp3;          
            
            
            r=r+1; %Increase counter by 1
            
        else
              
            r = r+1; %Increase counter by 1
            
        end
    end
   
    r=c; %reset row counter
    
    d=0; %Create new counter for inside Gauss Elim.
    
    %Do Gauss Elimination
    while r+d<m
        
        if U(r+d+1,c) ~= 0 %Check if element already equals 0
            
            Q = U(r+d+1,c)/U(r,c); %divide 2nd row by 1st row
            U(r+d+1,:) = U(r+d+1,:)-Q.*U(r,:); %Eliminate target element
            L(r+d+1,c) = Q;  %Transfer Q to L Matrix
            
        end
         d=d+1; %Increase Counter for Gauss Elimination
    end
                       
    
    c=c+1; %Go to next Column (back to top, Pivot, then eliminate.
    
    r=c; %Restart row counter to equal column value.
    
end

%Create Diagonal ones in L Matrix:
r=1; %Counter
while r<=m
    L(r,r) = 1;
    r=r+1;
end

%End Result of U, L and P Matrixes 

            
            











