//
//  ToolSize.h
//  WallBeautyPower
//
//  Created by tusm on 16/5/8.
//  Copyright © 2016年 WallBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HeightNavigationAndStateBar 64  //nav高度
#define HeightStateBar 20 //状态栏高度
#define HeightTabBar 49  //底部Tab高度

//屏幕宽高
#define HeightScreen [[UIScreen mainScreen] bounds].size.height
#define WidthScreen [[UIScreen mainScreen] bounds].size.width

//间距设置
#define SpaceSmall 5
#define SpaceMediumSmall 10
#define SpaceMediumBig 15
#define SpaceBig 20

//分隔线的高度
#define HeightLine 0.8
/**
 *  尺寸工具
 */
@interface ToolSize : NSObject

/**
 *  获取UILabel文字宽度
 *
 *  @param text <#text description#>
 *  @param font <#font description#>
 *
 *  @return <#return value description#>
 */
+(float)widthWithText:(NSString *)text  Font:(UIFont *)font;

/**
 *  获取UILabel文字高度
 *
 *  @param text  <#text description#>
 *  @param font  <#font description#>
 *  @param width <#width description#>
 *
 *  @return <#return value description#>
 */
+(float)heightWithText:(NSString *)text Font:(UIFont *)font maxWidth:(CGFloat)width;

/**
 *  获取UILabel文字尺寸
 *
 *  @param text <#text description#>
 *  @param font <#font description#>
 *  @param maxW <#maxW description#>
 *
 *  @return <#return value description#>
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

/**
 *  获取UILabel文字尺寸
 *
 *  @param text <#text description#>
 *  @param font <#font description#>
 *
 *  @return <#return value description#>
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;

@end
