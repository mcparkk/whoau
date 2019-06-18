//
//  Camera.m
//  OpenCameraTest
//
//  Created by 조기현 on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//
#ifndef __cplusplus
#import <opencv2/opencv.hpp>
#endif
#import <opencv2/videoio/cap_ios.h>
#import "Camera.h"



using namespace cv;
// Class extension to adopt the delegate protocol
@interface Camera () <CvVideoCameraDelegate>
{
}
@end
@implementation Camera
{
    UIViewController * viewController;
    UIImageView * imageView;
    CvVideoCamera * videoCameraBack;
    CvVideoCamera * videoCameraFront;
}

-(id)initWithController:(UIViewController*)c andImageView:(UIImageView*)iv
{
    viewController = c;
    imageView = iv;
    
    videoCameraBack = [[CvVideoCamera alloc] initWithParentView:imageView];
    videoCameraFront = [[CvVideoCamera alloc] initWithParentView:imageView];
    // ... set up the camera
    
    
    videoCameraBack.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack; // Use the back camera
    videoCameraBack.defaultAVCaptureSessionPreset = AVCaptureSessionPresetiFrame1280x720;
    videoCameraBack.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait; // Ensure proper orientation
    videoCameraBack.rotateVideo = YES; // Ensure proper orientation
    videoCameraBack.defaultFPS = 30; // How often 'processImage' is called, adjust based on the amount/complexity
    videoCameraBack.delegate = self;
    
    videoCameraFront.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront; // Use the back camera
    videoCameraFront.defaultAVCaptureSessionPreset = AVCaptureSessionPresetiFrame1280x720;
    videoCameraFront.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait; // Ensure proper orientation
    videoCameraFront.rotateVideo = YES; // Ensure proper orientation
    videoCameraFront.defaultFPS = 30; // How often 'processImage' is called, adjust based on the amount/complexity
    videoCameraFront.delegate = self;
    
    return self;
}
// This #ifdef ... #endif is not needed except in special situations
#ifdef __cplusplus
- (void)processImage:(Mat&)image
{
    // Do some OpenCV stuff with the image
}
#endif

-(void)start
{
    self.BackCamera = YES;
    [videoCameraFront stop];
    [videoCameraBack start];
    
    //videoCameraBack.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront; // Use the back camera
}

-(void)stop{
    self.BackCamera = NO;
    [videoCameraBack stop];
    [videoCameraFront start];
}
@end


