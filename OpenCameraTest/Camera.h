//
//  Camera.h
//  OpenCameraTest
//
//  Created by 조기현 on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface Camera : NSObject
@property (nonatomic, assign) BOOL BackCamera;

-(id)initWithController:(UIViewController*)c andImageView:(UIImageView*)iv;

-(void)start;
-(void)stop;

@end

NS_ASSUME_NONNULL_END
