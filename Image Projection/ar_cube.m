function [proj_points, t, R] = ar_cube(H,render_points,K)
%% ar_cube
% Estimate your position and orientation with respect to a set of 4 points on the ground
% Inputs:
%    H - the computed homography from the corners in the image
%    render_points - size (N x 3) matrix of world points to project
%    K - size (3 x 3) calibration matrix for the camera
% Outputs: 
%    proj_points - size (N x 2) matrix of the projected points in pixel
%      coordinates
%    t - size (3 x 1) vector of the translation of the transformation
%    R - size (3 x 3) matrix of the rotation of the transformation
% Written by Stephen Phillips for the Coursera Robotics:Perception course

% YOUR CODE HERE: Extract the pose from the homography
RT=[H(:,1) H(:,2), cross(H(:,1),H(:,2))];
[U, S , V]=svd(RT);
R=U * [1 0 0; 0 1 0; 0 0 det(U * V')]*V'
t=H(:,3)/norm(H(:,1));

% YOUR CODE HERE: Project the points using the pose
XC=(K * (R * render_points' + t))';
Div_mat=repmat(XC(:,3),[1,2]);
proj_points=XC(:,1:2)./Div_mat;



end
