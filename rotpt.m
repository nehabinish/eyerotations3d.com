function rotpoint = rotpt(point, radang)

% Function to rotate an input point by the angles in x,y and z directions
% according to Fick's Rotation sequence.
%
% Description:
%
%   Using the angles input through the variable 'radang', the function
%   rotates the point in x, y and z directions respectively.
%   
%   'point' - Point to be rotated
%
%   'radang' - Measure of angles in x, y and z co-ordinates to rotate the
%              point.
%
%   'rotpoint' - Final rotated point.
%

%% Define the three angles of rotation 

    thetaf = rad2deg(radang(3));
    phif   = rad2deg(radang(2));
    psif   = rad2deg(radang(1));
 
%% Define the rotation matrix

    R1 = [1 0 0; 0 cos(psif) -sin(psif) ; 0 sin(psif) cos(psif)] ;
    R2 = [cos(phif) 0 sin(phif) ; 0 1 0 ; -sin(phif) 0  cos(phif)];
    R3 = [cos(thetaf) -sin(thetaf) 0 ; sin(thetaf) cos(thetaf) 0 ; 0 0 1];

%% Rotate points

    Rfick     = R3 * R2 * R1;

    rotpoint = Rfick * point;


end %rotpt
