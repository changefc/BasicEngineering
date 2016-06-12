//
//  ViewControllerBasic.m
//  YiuBook
//
//  Created by tusm on 15/10/21.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ViewControllerBasic.h"
#import "BarButtonItem.h"
#import "ToolColor.h"

#define ColorNavBar [UIColor whiteColor]  //导航栏背景色
@interface ViewControllerBasic ()

@end

@implementation ViewControllerBasic
-(id)init{
    self=[super init];
    if(self){
        [self setupBasic];
        self.navgationState=NavgationStateMain;
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupViewBasic];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.netWorkRM.deletage=nil;
    self.netWorkRM.deletage=self;
    switch (self.navgationState) {
        case NavgationStateMain:{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            self.navigationController.navigationBar.hidden=NO;
            self.navigationController.navigationBar.translucent=NO;
            [self.navigationController.navigationBar setBarTintColor:ColorNavBar];
            [self.navigationController.navigationBar setTintColor:ColorNavBar];
            NSDictionary *attriText=[NSDictionary dictionaryWithObjectsAndKeys:ColorWhite,NSForegroundColorAttributeName, nil];
            [self.navigationController.navigationBar setTitleTextAttributes:attriText];
        }
            break;
        case NavgationStateMainWithBack:{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            self.navigationController.navigationBar.hidden=NO;
            self.navigationController.navigationBar.translucent=NO;
            [self.navigationController.navigationBar setBarTintColor:ColorNavBar];
            [self.navigationController.navigationBar setTintColor:ColorNavBar];
            NSDictionary *attriText=[NSDictionary dictionaryWithObjectsAndKeys:ColorNavTitle,NSForegroundColorAttributeName, nil];
            [self.navigationController.navigationBar setTitleTextAttributes:attriText];
            
            // 导航条返回按钮
            BarButtonItem *barButtonLeft=[BarButtonItem barItemWithTitle:@"返回" image:[UIImage imageNamed:@"bar_left_nomal"] selectedImage:[UIImage imageNamed:@"bar_left_press"] isImageLeft:YES target:self action:@selector(back)];
            [self.navigationItem setLeftBarButtonItem:barButtonLeft];
        }
            break;
        case NavgationStateHide:{
            [self.navigationController.navigationBar setBarTintColor:ColorNavBar];
            [self.navigationController.navigationBar setTintColor:ColorNavBar];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            self.navigationController.navigationBar.hidden=YES;
        }
            break;
        default:
            break;
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if(self.hudBasic!=nil)
        [self.hudBasic hide:YES];
}
-(void)setupViewBasic{
    self.view.backgroundColor=ColorBGGray;
}
-(void)setupBasic{
    self.netWorkRM=[NetWorkRequestManager instanceRequest];
}
/**
 *  显示提示框
 *
 *  @param hudText 提示框内容
 */
-(void)showHudWitText:(NSString *)hudText{
    if(self.hudBasic!=nil)
        self.hudBasic=nil;
    UIWindow *window=[[[UIApplication sharedApplication] windows] lastObject];
    self.hudBasic=[[MBProgressHUD alloc] initWithView:window];
    [window addSubview:self.hudBasic];
    self.hudBasic.mode=MBProgressHUDModeIndeterminate;
    self.hudBasic.labelText=hudText;
    [self.hudBasic show:YES];
    [self performSelector:@selector(hidHud) withObject:nil afterDelay:15.0f];
}
/**
 *  隐藏提示框
 */
-(void)hidHud{
    [self.hudBasic hide:YES];
    self.hudBasic=nil;
}
/**
 *  退出当前控制器
 */
-(void)back{
    [self.view endEditing:YES];
    if(self.navigationController.viewControllers.count>1){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
/**
 *  进入下一个控制器
 *
 *  @param viewControllerToPresent 控制器
 *  @param flag                    是否开启跳转动画
 *  @param completion              完成跳转执行的任务
 */
-(void)presentViewOrPushController:(UIViewController *)viewControllerToPresent
                          animated:(BOOL)flag
                        completion:(void (^)(void))completion{
    if(self.navigationController.viewControllers.count>0){
        [self.navigationController pushViewController:viewControllerToPresent animated:flag];
    }else{
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:viewControllerToPresent];
        [self presentViewController:nav animated:flag completion:completion];
    }
}
#pragma deletage NetWork
/**
 *  网络请求失败
 *
 *  @param request <#request description#>
 */
-(void)requestFail:(ASIHTTPRequest *)request{
    [self hidHud];
}
/**
 *  完成所有网络请求
 */
-(void)requestFinishAll{
    [self hidHud];
}
@end
