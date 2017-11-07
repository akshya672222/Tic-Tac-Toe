//
//  GlobalFunctions.m
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import "GlobalFunctions.h"

@implementation GlobalFunctions

+ (instancetype) shared{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)createShadowOnView:(UIView *)view color:(UIColor *)color width:(CGFloat)width height:(CGFloat)height shadowOpacity:(CGFloat)shadowOpacity andShadowRadius:(CGFloat)radius{
    view.layer.masksToBounds = NO;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(width,height);
    view.layer.shadowOpacity = shadowOpacity;
    [view.layer setShadowRadius:radius];
}

- (void)createRoundCornerToView:(UIView *)view cornerRadius:(CGFloat)cornerRadius{
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = NO;
}

- (void)addborderTo:(UIView *)view withColor:(UIColor *)color andWidth:(CGFloat)width{
    view.layer.borderWidth = width;
    view.layer.borderColor = color.CGColor;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
