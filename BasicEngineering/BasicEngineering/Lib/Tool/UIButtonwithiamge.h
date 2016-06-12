//
//  UIButtonwithiamge.h
//  YiuBook
//
//  Created by tusm on 15/5/15.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButtonwithiamge : UIButton
@property(strong,nonatomic) UILabel *titleL;
@property(strong,nonatomic) UIImageView *imageV;
+ (instancetype)button;
@end