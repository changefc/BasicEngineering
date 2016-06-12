//
//  ToolImage.h
//  WallBeautyPower
//
//  Created by tusm on 16/5/8.
//  Copyright © 2016年 WallBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  图片工具
 */
@interface ToolImage : NSObject

/**
 *  纯色图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageWithColor:(UIColor *)color;
/**
 *  纯色图片
 *
 *  @param color <#color description#>
 *  @param alpha <#alpha description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageWithColor:(UIColor *)color withAlpha:(float)alpha;
/**
 *  设置图片的透明度
 *
 *  @param alpha <#alpha description#>
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
/**
 *  纯色图片
 *
 *  @param color <#color description#>
 *  @param size  <#size description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;
/**
 *  纯色图片
 *
 *  @param color <#color description#>
 *  @param size  <#size description#>
 *  @param alpha <#alpha description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size withAlpha:(float)alpha;

@end
