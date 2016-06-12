//
//  ViewControllerBasicTableViewRefresh.m
//  YiuBook
//
//  Created by tusm on 15/10/22.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ViewControllerBasicTableViewRefresh.h"
#import "ViewTableFooter.h"
#define ColorRefreshMain [UIColor whiteColor]
@interface ViewControllerBasicTableViewRefresh ()<
MJRefreshBaseViewDelegate,
SRRefreshDelegate,
UIScrollViewDelegate>

@end

@implementation ViewControllerBasicTableViewRefresh

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.refreshType) {
        case RefreshTypeMJRefreshFooter:{
            [self setupBasicFooterRefresh];
        }
            break;
        case RefreshTypeSRRefresh:{
            [self setupBasicSRRefreshView];
        }
            break;
        case RefreshTypeMJAndSR:{
            [self setupBasicFooterRefresh];
            [self setupBasicSRRefreshView];
        }
            break;
        default:
            break;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.footer endRefreshing];
    [self.refreshView endRefresh];
}
/**
 *  设置SRRefreshView
 */
-(void)setupBasicSRRefreshView{
    self.refreshView=[[SRRefreshView alloc] init];
    self.refreshView.slimeMissWhenGoingBack=YES;
    self.refreshView.delegate=self;
    self.refreshView.upInset=MarginTableViewTop;
    self.refreshView.slime.bodyColor = ColorRefreshMain;
    self.refreshView.slime.skinColor = [UIColor whiteColor];
    self.refreshView.slime.lineWith = 1;
    self.refreshView.slime.shadowBlur = 2;
    self.refreshView.slime.shadowColor = ColorRefreshMain;
    [self.tableViewBasic addSubview:self.refreshView];
    
    [self setTableBasicFrame:self.tableViewBasic.frame];
}
-(void)setTableBasicFrame:(CGRect)frameTable{
    if(self.refreshType==RefreshTypeSRRefresh||self.refreshType==RefreshTypeMJAndSR){
        CGFloat marginTop=MarginTableViewTop-3;
        self.tableViewBasic.frame=CGRectMake(frameTable.origin.x, frameTable.origin.y-marginTop, frameTable.size.width, frameTable.size.height+marginTop);
    }else{
        self.tableViewBasic.frame=frameTable;
    }
}
/**
 *  初始化MJFreshView
 */
-(void)setupBasicFooterRefresh{
    // 1.上拉刷新(上拉加载更多数据)
    self.footer = [MJRefreshFooterView footer:ReFreshFooterViewHeigth];
    self.footer.scrollView = self.tableViewBasic;
    self.footer.delegate = self;
    
    //3:表格的尾部
    ViewTableFooter *tableFooterView = [[ViewTableFooter alloc]init];
    self.tableViewBasic.tableFooterView = tableFooterView;
    
    self.tableViewBasic.contentInset=UIEdgeInsetsMake(0, 0, SizeHeightTableFooter+SpaceMediumSmall, 0);
}
/**
 *  控制器销毁时释放刷新条
 */
- (void)dealloc
{
    [self.footer free];
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
        [self onLoadFooterMessage];
    }
}
//Re footer(加载更多数据)
-(void)onLoadFooterMessage{
    self.isLoadNewMessageBasic=NO;
}
//SR refresh（下拉）
-(void)onslimeRefreshStartRefresh{
    self.isLoadNewMessageBasic=YES;
}
//SR refresh（上拉）
-(void)onslimeRefreshstartFooterFresh{
    self.isLoadNewMessageBasic=NO;
}
#pragma deletage UIScrollerView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.refreshView) {
        [self.refreshView scrollViewDidScroll];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.refreshView) {
        [self.refreshView scrollViewDidEndDraging];
    }
}
#pragma mark - SRRefreshDelegate
/**
 *  SRRefresh刷新获取新数据
 *
 *  @param refreshView <#refreshView description#>
 */
- (void)slimeRefreshStartRefresh:(SRRefreshView*)refreshView {
    [self onslimeRefreshStartRefresh];
}
/**
 *  SRRefresh刷新获取更多数据
 *
 *  @param refreshView <#refreshView description#>
 */
-(void)slimeRefreshstartFooterFresh{
    [self onslimeRefreshstartFooterFresh];
}
#pragma deletage NetWork
/**
 *  所有请求完成时自动停止刷新条
 */
-(void)requestFinishAll{
    [super requestFinishAll];
    [self.footer endRefreshing];
    [self.refreshView endRefresh];
}
/**
 *  网络请求失败时自动停止刷新条
 *
 *  @param request <#request description#>
 */
-(void)requestFail:(ASIHTTPRequest *)request{
    [super requestFail:request];
    [self.footer endRefreshing];
    [self.refreshView endRefresh];
}
@end
