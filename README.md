# Robotics-Perception
This are my solutions for the projects of [Robotics Perception](https://www.coursera.org/learn/robotics-perception): The following tasks are performed:


## Dolly Zoom:
In this code we create a dolly zoom effect by changing the focal length and distance of the camera.

## Image Projection Using Homographies:
* The Homography matrix is first calculated using the patched Chess board images in **est_homography.m** function 
* Then using inverse wrapping in **inverse_wrapping.m**, we first calculate the projection of points where our image needs to be replaced
* Then place the image using the homography matrix already calculated.

## Image Projection
* In **track_corners** using matlab computer vision module's Pointtracker to track corners of the image and store them in an array.
* Then use the same method as used in previous code, to estimate homography in **est_homography.m** function
* The computed homography is use to evaluate the rotation and translation in the **ar_cube**

## Structure from Motion
### Fundamental Matrix Estimation
* We have N >= 8 correspondences between two images, which are then used to estimate the Fundamental matrix linearly in **EstimateFundamentalMatrix**
### Essential Matrix Estimation
* We then evaluate the essential matrix using the camera' instrinsic parameter K in **EssentialMatrixFromFundamentalMatrix**
### Linear Triangulation
* Using the relative Camera transform we trianglulate the 3D points using linear Least Squares.
### NonLinear Triangulation
* Given three camera poses and linearly triangulated points, we refine the locations of
the 3D points that minimizes reprojection error utilizing Jacobian matrix and taylor series expansion of differentials.
