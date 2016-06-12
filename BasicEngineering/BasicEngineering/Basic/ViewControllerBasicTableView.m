//
//  ViewControllerBasicTableView.m
//  YiuBook
//
//  Created by tusm on 15/10/21.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ViewControllerBasicTableView.h"

@interface ViewControllerBasicTableView ()

@end
@implementation ViewControllerBasicTableView

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupTableViewBasic];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
/**
 *  初始化表格
 */
-(void)setupTableViewBasic{
    CGFloat HeightTableView=HeightScreen-HeightNavigationAndStateBar;
    self.tableViewBasic=[[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-HeightTableView, WidthScreen, HeightTableView)];
    self.tableViewBasic.backgroundColor=[UIColor clearColor];
    self.tableViewBasic.contentInset=UIEdgeInsetsMake(0, 0, SpaceBig, 0);
    self.tableViewBasic.showsHorizontalScrollIndicator=NO;
    self.tableViewBasic.showsVerticalScrollIndicator=NO;
    self.tableViewBasic.bounces=YES;
    self.tableViewBasic.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableViewBasic.autoresizingMask=UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:self.tableViewBasic];
}
@end
