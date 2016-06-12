//
//  NetWorkRequestManager.h
//  YiuBook
//
//  Created by tusm on 15/9/10.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@protocol NetWorkRequestManagerDeletage<NSObject>
@optional
//所有请求加载完毕
-(void)requestFinishAll;
//0:异常回调
- (void)requestFail:(ASIHTTPRequest *)request;

@end
@interface NetWorkRequestManager : NSObject
@property(nonatomic,assign)id<NetWorkRequestManagerDeletage> deletage;
+(id)instanceRequest;

@end
