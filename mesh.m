function [stpts, pixsz] = mesh(scene)

% Create and display the screen with mesh points
%
% Description:
%
%   Using the structure of the screen, this function creates and displays
%   a screen.
%   
%   'scene' - Input structure
%      
%      'screenPosition' - A structure that contains the spatial position of a
%           screen that the eye is fixating upon. Sub-fields:
%
%           'distance' - A scalar that specifies the distance (in mm) of
%               the screen from the eye, when the optical axis of the eye 
%               is aligned with the center of the screen.
%
%           'dimensions' - 1x2 vector in units of mm that provides the 
%               width and height of the screen on which the stimulus is 
%               presented.
%
%           'resolutions' - 1x2 vector in units of pixels for the width 
%               and height.
% Output:
%   
%   'stpts' - Final location of the stimulus on the screen.
%
%% create a mesh using screen size.

ii = - scene.screenPosition.dimensions(1)/2 : scene.screenPosition.dimensions(1)/2;
jj = - scene.screenPosition.dimensions(2)/2 : scene.screenPosition.dimensions(2)/2;

[a,b] = meshgrid(ii,jj);

figure(1)

mrksz = 20;

scatter(a(:), b(:), mrksz, '.', 'k');
hold on;

%% size of stimulus in pixels 

pixsz = sqrt(mrksz/pi) * 2;

%% fixation 

idx = knnsearch([a(:) b(:)],[0 0]) ; 
h2  = plot(a(idx),b(idx),'ob', 'MarkerSize', 12);
hold on; 

%% choose stimulus motion point

prompt = 'Input the location of the gaze vector ';
disp(prompt);
    
again = true;
while again
    [x, y] = ginput(1);
    promptMessage = sprintf('Do you want to accept this point and Continue\nor re-do it and click the point again?');
    titleBarCaption = 'Continue?';
    buttonText = questdlg(promptMessage, titleBarCaption, 'Continue', ...
        'Re-do', 'Continue');
    if strcmpi(buttonText, 'Continue')
        again = false;
    end
end

h3 = compass(x,y);
set(h2,'Visible','off');

idx = knnsearch([a(:) b(:)],[x y]) ; 
h4 = plot(a(idx),b(idx),'ob', 'MarkerSize', 12);
hold off; 

stpts = [x,y];

end % mesh
