//
//  ToolNetWork.h
//  YiuBook
//
//  Created by tusm on 15/8/18.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSInteger, NetWorkState) {
    NetWorkStateLocalWifi=0,
    NetWorkStateInternetConnection=1<<0,
    NetWorkStateError=1<<1
};
@interface ToolNetWork : NSObject
+(NetWorkState)CheckNetWorkState;
@end
