//
//  ToolBlackView.m
//  YiuBook
//
//  Created by tusm on 15/5/20.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ToolBlackView.h"
@interface ToolBlackView()
@property(nonatomic,assign)BOOL isInKeyWindow;
@end
@implementation ToolBlackView
-(id)init{
    self=[super init];
    if(self){
        self.isInKeyWindow=NO;
        [self SetUp];
    }
    return self;
}
/**
 *  初始化是否在主窗口，在主窗口不遮挡键盘
 *
 *  @param isInKeyWindow <#isInKeyWindow description#>
 *
 *  @return <#return value description#>
 */
-(id)initWithInkeyWindow:(BOOL)isInKeyWindow{
    self=[super init];
    if(self){
        self.isInKeyWindow=isInKeyWindow;
        [self SetUp];
    }
    return self;
}
-(void)SetUp{
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    UIWindow *window;
    if(self.isInKeyWindow){
        window= [[UIApplication sharedApplication] keyWindow];
        NSLog(@"key:%@",window);
        NSArray *windows=[[UIApplication sharedApplication] windows];
        for(UIWindow *window in windows){
            NSLog(@"%@",window);
        }
    }else{
        window= [[[UIApplication sharedApplication] windows] lastObject];
    }
    self.hidden=YES;
    self.isHideOnClick=YES;
    [window addSubview:self];
    [self addTarget:self action:@selector(HideBlackView) forControlEvents:UIControlEventTouchUpInside];
    self.isReSetBackView=NO;
}
-(void)ShowBlackViewWithReSetType:(bool)isReSetBackView{
    self.hidden=NO;
    self.isReSetBackView=isReSetBackView;
}
/**
 *  隐藏view 如果不消失查看isHideOnClick是否为yes
 */
-(void)HideBlackView{
    if(self.isHideOnClick){
        self.hidden=YES;
    }
    if(self.isReSetBackView){
        for(UIView *view in self.subviews)
        {
            [view removeFromSuperview];
        }
    }
}
@end
