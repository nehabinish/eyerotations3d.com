function eyesim(rotang)

% Function that plots the initial and final eye positions after rotating to
% follow stimulus.
%
% Description:
%
%   The eye rotates in the yaw and pitch axes to apprach the new gaze
%   direction and also executes a false torsion in the roll direction.
%   
%   'rotangles' - Fick angles - theta, phi and psi 
%
%% Initial gaze position (at fixation point - (0 0 0) )

[X,Y,Z] = sphere;

figure, 
hold on
axis equal, view([1 0 0]);

% sphere with transparence
surf(X,Y,Z, 'FaceColor', [1 1 1], 'EdgeColor', 'none','FaceAlpha',0.5);
light

% Radius of the eye
R = max(sqrt(X(:).^2 + Y(:).^2 + Z(:).^2));

% Radius of the iris
ri = 0.55;
% Distance from the center
hi = sqrt(R^2 - ri^2);

% Display iris
n = 100;
a = linspace(0,2*pi,n);
fill3(hi*ones(n,1), ri*cos(a(:)), ri*sin(a(:)),'b');

% Radius of the pupil
rp = 0.3;
% Distance from the center
hp = sqrt(R^2-rp^2);
% Display pupil
n = 100;
a = linspace(0,2*pi,n);
fill3( hp*ones(n,1), rp*cos(a(:)), rp*sin(a(:)),'k');

title('Initial Eye Position/ Primary position ( before rotation )')
xlabel('x-axis (\psi_F) - torsion')
ylabel('y-axis (\phi_F)')
zlabel('z-axis (\theta_F)')

hold off

%% Final position of the eye after rotation

[X,Y,Z] = sphere;
% figure 
figure,
hold on
axis equal, view([1 0 0]);

% sphere with transparence
s1 = surf(X,Y,Z, 'FaceColor', [1 1 1], 'EdgeColor', 'none','FaceAlpha',0.5);
light

% Radius of the eye 
R = max(sqrt(X(:).^2+Y(:).^2+Z(:).^2));

% Radius of the iris
ri = 0.55;
% Distance from the center
hi = sqrt(R^2-ri^2);
% Display iris
n = 100;
a = linspace(0,2*pi,n);
s2 = fill3(hi*ones(n,1), ri*cos(a(:)), ri*sin(a(:)),'b');

% Radius of the pupil
rp = 0.3;
% Distance from the center
hp = sqrt(R^2-rp^2);
% Display pupil
s3 = fill3( hp*ones(n,1), rp*cos(a(:)), rp*sin(a(:)),'k');

% Rotation axes
xdir = [1   0   0];
ydir = [0   1   0];
zdir = [0   0   1];

% Rotate the sphere

rotate(s1,ydir,rotang(1));
rotate(s1,zdir,rotang(2));
rotate(s1,xdir,rotang(3));

% Rotation of pupil

rotate(s2,ydir,rotang(1));
rotate(s2,zdir,rotang(2));
rotate(s2,xdir,rotang(3));

% Rotation of iris

rotate(s3,ydir,rotang(1));
rotate(s3,zdir,rotang(2));
rotate(s3,xdir,rotang(3));

title('Final Eye Position ( after rotation )')
xlabel('x-axis (\psi_F) - torsion')
ylabel('y-axis (\phi_F)')
zlabel('z-axis (\theta_F)')

hold off

end %eyesim
