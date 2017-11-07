//
//  GlobalFunctions.h
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GlobalFunctions : NSObject

+ (instancetype) shared;

-(void)createShadowOnView:(UIView *)view color:(UIColor *)color width:(CGFloat)width height:(CGFloat)height shadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)radius;
-(void)createRoundCornerToView:(UIView *)view cornerRadius:(CGFloat)cornerRadius;
-(void)addborderTo:(UIView *)view withColor:(UIColor *)color andWidth:(CGFloat)width;
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
