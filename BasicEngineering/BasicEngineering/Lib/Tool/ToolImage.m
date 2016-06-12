//
//  ToolImage.m
//  WallBeautyPower
//
//  Created by tusm on 16/5/8.
//  Copyright © 2016年 WallBeauty. All rights reserved.
//

#import "ToolImage.h"
/**
 *  图片工具
 */
@implementation ToolImage

+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size{
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size withAlpha:(float)alpha{
    UIImage *image=[ToolImage imageWithColor:color withSize:size];
    return [ToolImage imageByApplyingAlpha:alpha image:image];
}

+(UIImage *)imageWithColor:(UIColor *)color{
    return [ToolImage imageWithColor:color withSize:CGSizeMake(1, 1)];
}

+(UIImage *)imageWithColor:(UIColor *)color withAlpha:(float)alpha{
    return [ToolImage imageWithColor:color withSize:CGSizeMake(1, 1) withAlpha:alpha];
}


@end
