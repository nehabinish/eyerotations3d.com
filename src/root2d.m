function F = root2d(x, rfinal)
% Find the roots of the function (system of equations to convert rotation
% vectors to Fick's angles)
%
% Description:
%
%  Roots of the function.
%   
%   'x' - Initial guess values for Fick's angles
%
%   'rfinal' - Final rotation vector for eye rotation respecting Listing's
%       Law two dimensional reduction.
%
% 
% Output:
%
%   'F' - Function roots
%   
%% Fick's angles

theta_f = x(1);
phi_f   = x(2);
psi_f   = x(3);

%% Final rotation vectors 

r1      = rfinal(1);
r2      = rfinal(2);
r3      = rfinal(3);

%% Roots of the equation

F(1) = r1 - ( ( tan(psi_f/2) - (tan(theta_f/2) * tan(phi_f/2)) ) / ...
        ( 1 + (tan(theta_f/2) * tan(phi_f/2) * tan(psi_f/2)) ) );

F(2) = r2 - ( ( tan(phi_f/2) + (tan(theta_f/2) * tan(psi_f/2)) ) / ...
        ( 1 + (tan(theta_f/2) * tan(phi_f/2) * tan(psi_f/2)) ) ); 
    
F(3) = r3 - ( ( tan(theta_f/2) - (tan(phi_f/2) * tan(psi_f/2)) ) / ...
        ( 1 + (tan(theta_f/2) * tan(phi_f/2) * tan(psi_f/2)) ) );
    
end % root2d

    
