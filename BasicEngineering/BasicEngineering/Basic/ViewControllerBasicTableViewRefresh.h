//
//  ViewControllerBasicTableViewRefresh.h
//  YiuBook
//
//  Created by tusm on 15/10/22.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ViewControllerBasic.h"
#import "ViewControllerBasicTableView.h"
#import "MJRefresh.h"
#import "SRRefreshView.h"

#define MarginTableViewTop 47
#define ReFreshFooterViewHeigth 20

/**
 *  刷新条类型
 */
typedef NS_ENUM(NSInteger, RefreshType){
    /**
     *   只有底部加载
     */
    RefreshTypeMJRefreshFooter,
    /**
     *   只有顶部加载
     */
    RefreshTypeSRRefresh,
    /**
     *   顶部加载和底部加载
     */
    RefreshTypeMJAndSR
};
/**
 *  TableView控制器基础类(自带刷新)
 */
@interface ViewControllerBasicTableViewRefresh : ViewControllerBasicTableView
/**
 *  底部刷新条
 */
@property(nonatomic, strong) MJRefreshFooterView *footer;
/**
 *  顶部刷新条
 */
@property(nonatomic,strong)SRRefreshView *refreshView;
/**
 *  刷新条类型（在[super viewDidLoad]前定义）
 */
@property(nonatomic,assign)RefreshType refreshType;
/**
 *  是否加载新的数据件原来的数据清空
 */
@property(nonatomic,assign)BOOL isLoadNewMessageBasic;

/**
 *  加载更多数据
 */
-(void)onLoadFooterMessage;

/**
 *  在RefreshTypeSRRefresh状态开始加载最新数据
 */
-(void)onslimeRefreshStartRefresh;

/**
 *  在RefreshTypeSRRefresh状态下获取获取更多数据
 */
-(void)onslimeRefreshstartFooterFresh;

-(void)setTableBasicFrame:(CGRect)frameTable;
@end
