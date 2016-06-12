//
//  NetWorkRequestManager.m
//  YiuBook
//
//  Created by tusm on 15/9/10.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "NetWorkRequestManager.h"
#import "ToolAlertMessage.h"
#import "ToolJsonData.h"

#define BASEPATH @"http://115.28.20.6:8080/Order/api/"

@interface NetWorkRequestManager()
@property(nonatomic,assign)NSInteger currentRequestNumber;//当前请求的条数
@end
@implementation NetWorkRequestManager

/**
 *  初始化网络管理类
 */
+(id)instanceRequest{
    static NetWorkRequestManager *request;
    if(request==nil){
        request=[[NetWorkRequestManager alloc]init];
        request.currentRequestNumber=0;
    }
    return request;
}

//发送请求时增加请求的数量(发送请求时使用)
-(void)onSendRequest{
    self.currentRequestNumber+=1;
}
/**
 *  请求完成减少请求数量(完成请求时使用)
 */
-(void)onRequsetFinishOrFail{
    self.currentRequestNumber-=1;
    if(self.currentRequestNumber<1){
        self.currentRequestNumber=0;
        if([self.deletage respondsToSelector:@selector(requestFinishAll)]){
            [self.deletage requestFinishAll];
        }
    }
}
/**
 *  开始发送异步请求时（都是异步请求）注：必须使用这个调用否则请求计数会出错
 *
 *  @param requestForm 请求
 */
-(void)onStartAsynchronous:(ASIFormDataRequest *)requestForm{
    [requestForm startAsynchronous];
    [self onSendRequest];
}
/**
 *  请求完成 注：必须使用这个调用否则请求计数会出错
 *
 *  @param request 请求返回
 *
 *  @return 返回数据
 */
-(NSString *)onRequestBackResult:(ASIHTTPRequest *)request{
    NSString *responseString = [request responseString];
    [self onRequsetFinishOrFail];
    return responseString;
}
/**
 *  请求异常回调
 */
- (void)requestFail:(ASIHTTPRequest *)request
{
    self.currentRequestNumber=0;
    [self onRequsetFinishOrFail];
    [ToolAlertMessage ShowAlertMessage:@"网络异常，请求失败！"];
    if([self.deletage respondsToSelector:@selector(requestFail:)]){
        [self.deletage requestFail:request];
    }
}
@end