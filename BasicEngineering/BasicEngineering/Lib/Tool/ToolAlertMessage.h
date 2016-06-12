//
//  ToolAlertMessage.h
//  YiuBook
//
//  Created by tusm on 15/5/19.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ToolAlertMessage : NSObject
/**
 *  提示框（防android透明灰色文字提示款）
 *
 *  @param message <#message description#>
 */
+(void)ShowAlertMessage:(NSString *)message;
@end
