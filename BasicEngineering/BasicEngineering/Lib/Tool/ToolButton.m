
//
//  ToolButton.m
//  WallBeautyPower
//
//  Created by tusm on 16/5/8.
//  Copyright © 2016年 WallBeauty. All rights reserved.
//

#import "ToolButton.h"
#import "ToolImage.h"
@implementation ToolButton

+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withColor:(UIColor *)color withTarget:(id)target  withAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[ToolImage imageWithColor:color] forState:UIControlStateNormal];
    [button setBackgroundImage:[ToolImage imageWithColor:color withAlpha:0.6] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FontTextContent;
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:3.0];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withColor:(UIColor *)color withTarget:(id)target  withAction:(SEL)action withCornerRadius:(CGFloat)cornerRadius{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[ToolImage imageWithColor:color] forState:UIControlStateNormal];
    [button setBackgroundImage:[ToolImage imageWithColor:color withAlpha:0.6] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FontTextContent;
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:cornerRadius];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)colorTitle withBGColor:(UIColor *)colorBG withBGHeightedColor:(UIColor *)colorHeight withTarget:(id)target  withAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[ToolImage imageWithColor:colorBG] forState:UIControlStateNormal];
    [button setBackgroundImage:[ToolImage imageWithColor:colorHeight] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:colorTitle forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:3.0];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)CreateMainButton:(CGRect)frame withTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)colorTitle withBGColor:(UIColor *)colorBG withBGHeightedColor:(UIColor *)colorHeight withBorderColor:(UIColor *)colorBorder withTarget:(id)target  withAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[ToolImage imageWithColor:colorBG] forState:UIControlStateNormal];
    [button setBackgroundImage:[ToolImage imageWithColor:colorHeight] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:colorTitle forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:3.0];
    button.layer.borderColor=colorBorder.CGColor;
    button.layer.borderWidth=HeightLine;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
