//
//  ToolBlackView.h
//  YiuBook
//
//  Created by tusm on 15/5/20.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolBlackView : UIControl

@property(nonatomic,assign)bool isReSetBackView;
@property(nonatomic,assign)bool isHideOnClick;
-(void)ShowBlackViewWithReSetType:(bool)isReSetBackView;
-(void)HideBlackView;
-(id)initWithInkeyWindow:(BOOL)isInKeyWindow;
@end
