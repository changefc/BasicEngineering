//
//  ToolNetWork.m
//  YiuBook
//
//  Created by tusm on 15/8/18.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ToolNetWork.h"
#import "Reachability.h"
@implementation ToolNetWork
/**
 *  获取网络状况
 *
 *  @return NetWorkStateLocalWifi  有wifi
            NetWorkStateInternetConnection  没有使用wifi, 使用手机自带网络进行上网
            NetWorkStateError    没有网络
 */
+(NetWorkState)CheckNetWorkState{
        // 1.检测wifi状态
        Reachability *wifi = [Reachability reachabilityForLocalWiFi];
        
        // 2.检测手机是否能上网络(WIFI\3G\2.5G)
        Reachability *conn = [Reachability reachabilityForInternetConnection];
        
        // 3.判断网络状态
        if ([wifi currentReachabilityStatus] != NotReachable) {
            return NetWorkStateLocalWifi;
        } else if ([conn currentReachabilityStatus] != NotReachable) {            return NetWorkStateInternetConnection;
        } else {
             return NetWorkStateError;
        }
}
@end
