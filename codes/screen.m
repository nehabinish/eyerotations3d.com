function scene = screen(varargin)
% Create and return the scene / structure and properties of the screen.
%
% Description:
%
%   Using default values and passed key/value pairs, this function creates 
%   the scene on which the stimulus is presented.
%   
%   'screenPosition' - A structure that defines the spatial position of a
%           screen that the eye is fixating upon. Sub-fields:
%
%      'distance' - A scalar that specifies the distance (in cm) of the 
%           screen from the eye, when the optical axis of the eye is
%           is aligned with the center of the screen.
%
%      'dimensions' - 1x2 vector [height,width] that provides the height
%           and the width of the screen on which the stimulus is 
%           presented(in cm).
%
%      'resolutions' - 1x2 vector in units of pixels for the width and
%           height.
% Output:
%  
%   'scene' - Screen structure containing information about the distance, 
%       dimensions and resolution of the screen.
%
%% input parser

p = inputParser; p.KeepUnmatched = true; p.PartialMatching = false;


% Default values

p.addParameter('sceneFileName', '' , @(x)(isempty(x) | ischar(x)));
p.addParameter('screenDistance', 53, @isnumeric);
p.addParameter('screenDimensions', [18,30], @isnumeric);
p.addParameter('screenResolutions', [1920,1080], @isnumeric);

% parse
p.parse(varargin{:})


%% screenPosition

scene.screenPosition.screenDistance = p.Results.screenDistance;
scene.screenPosition.dimensions     = p.Results.screenDimensions;
scene.screenPosition.resolutions    = p.Results.screenResolutions;

%% meta

scene.meta.createSceneGeometry          = p.Results; 
scene.meta.createSceneGeometry.varargin = varargin;

%% Save the sceneGeometry file

if ~isempty(p.Results.sceneFileName)
    save(p.Results.sceneFileName,'scene');
end

end % scene
 


