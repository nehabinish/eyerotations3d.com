function vsangst = visualangle(scene, vertres, stsize)
% Calulate the visual angle projected on the retina by the stimulus.
%
% Description:
%
%   Converts stimulus pixels to visual angle degrees to calculate the
%   perceived size of the stimulus or the size of the stimulus as 
%   presented on the retina.
%   
%   'height' - Height of the monitor (in cm).
%
%   'dist' - A scalar that specifies the distance (in cm) of the 
%       monitor from the eye/participant. 
%
%   'vertres' - Vertical Resolution of the monitor (in pixels).
%
%   'stsize' - Stimulus size in pixels.
% 
% Output:
%
%   'vsangst' - Visual angle measured from the eye lens or the size of the
%       stimulus projected on the retina / Size of the stimulus in degrees
%   

%% Parameters

dist   = scene.screenPosition.screenDistance;
height = scene.screenPosition.dimensions(1);


%% Visual Angle

pixdeg  = atan2d(0.5*height, dist) / (0.5*vertres); % degrees for a single 
                                                   % pixel

vsangst = stsize * pixdeg;

end % scene
