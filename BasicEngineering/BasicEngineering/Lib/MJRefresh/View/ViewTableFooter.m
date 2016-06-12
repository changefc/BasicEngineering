//
//  ViewTableFooter.m
//  YiuBook
//
//  Created by tusm on 15/9/18.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ViewTableFooter.h"
@implementation ViewTableFooter
-(id)init{
    self=[super init];
    if(self){
        [self setup];
    }
    return self;
}
-(void)setup{
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"已显示全部";
    lab.font = [UIFont boldSystemFontOfSize:12];
    lab.backgroundColor = [UIColor whiteColor];
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;;
    lab.alpha = 0.8;
    CGFloat labW = 80;
    lab.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labW)/2.0, 5, labW, 20);
    lab.layer.cornerRadius = 8;
    lab.layer.masksToBounds = YES;
    [self addSubview:lab];
    self.frame=CGRectMake(0, 0, WidthScreen, 0);
    [self addSubview:lab];
}
@end
