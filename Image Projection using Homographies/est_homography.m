function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
A=zeros(length(video_pts)*2,9);
%A
i=1;
j=1;
while j<length(video_pts)*2
   
    x1=video_pts(i,1);
    x2=video_pts(i,2);
    y1=logo_pts(i,1);
    y2=logo_pts(i,2);
    A(j,:)=[-x1 -x2 -1 0 0 0 x1*y1 x2*y1 y1];
    j=j+1;
    A(j,:)=[0 0 0 -x1 -x2 -1 x1*y2 x2*y2 y2];
    j=j+1;
    i=i+1;
    
end
%A
[U,S,V]=svd(A);
h=V(:,length(V));
H=reshape(h,[3,3])';

end


