//
//  UIButtonwithiamge.m
//  YiuBook
//
//  Created by tusm on 15/5/15.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "UIButtonwithiamge.h"
#define Btnfont [UIFont systemFontOfSize:13]

@implementation UIButtonwithiamge
+ (instancetype)button
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *imageV = [[UIImageView alloc]init];
        self.imageV = imageV;
        [self addSubview:imageV];
        
        UILabel *titleL = [[UILabel alloc]init];
        titleL.font = Btnfont;
        titleL.textColor = [UIColor grayColor];
        titleL.textAlignment= NSTextAlignmentCenter;
        self.titleL = titleL;
        [self addSubview:titleL];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageV.frame = CGRectMake(0, 0,20,self.frame.size.height);
    self.titleL.frame = CGRectMake(CGRectGetMaxX(self.imageV.frame), 0, self.frame.size.width-20, self.frame.size.height);
}
@end

