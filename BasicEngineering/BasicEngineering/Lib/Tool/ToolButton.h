//
//  ToolButton.h
//  WallBeautyPower
//
//  Created by tusm on 16/5/8.
//  Copyright © 2016年 WallBeauty. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  图片工具
 */
@interface ToolButton : NSObject
/**
 *  创建按钮
 *
 *  @param frame  <#frame description#>
 *  @param title  <#title description#>
 *  @param color  <#color description#>
 *  @param target <#target description#>
 *  @param action <#action description#>
 *
 *  @return <#return value description#>
 */
+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withColor:(UIColor *)color withTarget:(id)target  withAction:(SEL)action;

/**
 *  创建按钮（自定义字体、背景色）
 *
 *  @param frame       <#frame description#>
 *  @param title       <#title description#>
 *  @param font        <#font description#>
 *  @param colorTitle  <#colorTitle description#>
 *  @param colorBG     <#colorBG description#>
 *  @param colorHeight <#colorHeight description#>
 *  @param target      <#target description#>
 *  @param action      <#action description#>
 *
 *  @return <#return value description#>
 */
+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)colorTitle withBGColor:(UIColor *)colorBG withBGHeightedColor:(UIColor *)colorHeight withTarget:(id)target  withAction:(SEL)action;

/**
 *  创建按钮 可设置边界线
 *
 *  @param frame       <#frame description#>
 *  @param title       <#title description#>
 *  @param font        <#font description#>
 *  @param colorTitle  <#colorTitle description#>
 *  @param colorBG     <#colorBG description#>
 *  @param colorHeight <#colorHeight description#>
 *  @param colorBorder <#colorBorder description#>
 *  @param target      <#target description#>
 *  @param action      <#action description#>
 *
 *  @return <#return value description#>
 */
+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)colorTitle withBGColor:(UIColor *)colorBG withBGHeightedColor:(UIColor *)colorHeight withBorderColor:(UIColor *)colorBorder withTarget:(id)target  withAction:(SEL)action;

/**
 *  可自定义圆角
 *
 *  @param frame        <#frame description#>
 *  @param title        <#title description#>
 *  @param color        <#color description#>
 *  @param target       <#target description#>
 *  @param action       <#action description#>
 *  @param cornerRadius <#cornerRadius description#>
 *
 *  @return <#return value description#>
 */
+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withColor:(UIColor *)color withTarget:(id)target  withAction:(SEL)action withCornerRadius:(CGFloat)cornerRadius;
@end
