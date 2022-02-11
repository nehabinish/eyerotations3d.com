%% main script

clc
clear all
close all

%% Begin trials

% Total number of trials
N = str2double(input('Enter the total number of trials: ','s'));

while (isnan(N) || fix(N) ~= N || N == 0 || N < 0)  
    N = str2double(input('Please enter a positive integer value greater than zero for the number of trials: ', 's'));
end


%% Choose stimulus gaze vector position 

i = 1; 
rotationvec = zeros(N,3);
while i < N+1
    
    scene = screen();

    [stpts, pixsz] = mesh(scene);
 
    [theta, alpha, rfinal, rotang] = rotation(stpts, scene);
    rotationvec(i,:) = rfinal; 
    
    % Axis angle notation
    ndir  = [0; cos(alpha); -sin(alpha)];
    axang = [ndir(1) ndir(2) ndir(3) theta];
    
    % Converting rotation vector into Fick's angles
    x0         = [0,0,0];
    fun        = @(x)root2d(x,rfinal'); % function of dummy variable x
    Fickangles = fsolve(fun, x0);
    Fangdeg    = rad2deg(Fickangles);
    
    % Compare calculated Fick angles and Matlab calculated angles
    compare = @(a1,a2,no_points) ...
        round(a1*10^no_points)==round(a2*10^no_points);
    
    if (compare(Fickangles,rotang,4)) 
        disp('Rotation angles verified.\n' );
    else 
        disp('Rotation angles not equal, error in calculation.\n' );
    end    
 
    % Simulate the rotation of the eye for the selected stimulus position
    eyesim(Fangdeg);
    
    fprintf('Trial No: %d\nVisual angle = %f\260\n', i, theta)

%% Continue/Abort trials

    if i ~= N        
        promptMessage = sprintf('Do you want to continue to make the next trial? ');
        titleBarCaption = 'Continue?';
        buttonText = questdlg(promptMessage, titleBarCaption, 'Continue', ...
            'Abort', 'Continue');
    end    
    
    if strcmpi(buttonText, 'Abort') || i == N
        i = N;
        disp('End of trials.')
    end
    
    i = i+1;
    
end

figure;
for k = 1:N
    quiver3(0, 0, 0, rotationvec(k,1), rotationvec(k,2), rotationvec(k,3));
    hold on
end    
axis equal, view([1 1 0]);
title('Rotation vectors in the Listings Plane');
xlabel('x'); ylabel('y'); zlabel('z')

