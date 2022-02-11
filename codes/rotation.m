function [theta, alpha, rfinal, rotang] = rotation(pts, scene)
% Calulate the angle of rotation of the eyes made to follow the stimulus
% point
%
% Description:
%
%   Using the updated co-ordinates of the points, this routine calculates 
%   the rotation angle of the eye and the orientation of the
%   rotation axis with respect to the Listing's plane. The final rotation
%   vector is then returned as an output.
%   
%   'pts' - Co-ordinates of the stimulus on the screen to where the saccade
%       is made to.
%
%   'theta' - Angle of rotation of the eye to make the saccade to the 
%        projected stimulus on the screen.
%
%   'alpha' - Orientation of the rotation axis with respect to the 
%       Listing's plane.
%
%   'rfinal' - Complete rotation vector describing the rotation of the eye.
%       This vector describes the current eye position as a rotation from  
%       the reference position ( here, reference position is taken to be 
%       the fixation point - origin (0,0) ). It does not comprise of a 
%       torsional component.
%   

%% Angle of rotation of the eye

L = scene.screenPosition.screenDistance;
sx = pts(1);
sy = pts(2);

mgpts = sqrt(sx^2 + sy^2);

theta = atand(mgpts/L);

%% Orientation of the rotation axis

alpha = atan2(sy,sx);
alpha = rad2deg(alpha);

%% Complete rotation vector 

n =  [0; cosd(alpha); - sind(alpha)];

rfinal = tand(theta/2)* n';


%% yaw pitch roll

[yaw, pitch, roll] = rod2angle(rfinal);

rotang = [yaw, pitch, roll];

end % scene
