//
//  MJRefreshBaseView.m
//  MJRefresh
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJRefreshBaseView.h"
#import "MJRefreshConst.h"
#import "LoadAnimation.h"

@interface  MJRefreshBaseView()
{
    BOOL _hasInitInset;
}
/**
 交给子类去实现
 */
// 合理的Y值
- (CGFloat)validY;
// view的类型
- (MJRefreshViewType)viewType;
@end

@implementation MJRefreshBaseView

#pragma mark - 初始化方法
- (instancetype)initWithScrollView:(UIScrollView *)scrollView
{
    if (self = [super init]) {
        self.scrollView = scrollView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_hasInitInset) {
        _scrollViewInitInset = _scrollView.contentInset;
        
        [self observeValueForKeyPath:MJRefreshContentSize ofObject:nil change:nil context:nil];
        
        _hasInitInset = YES;
        
        if (_state == MJRefreshStateWillRefreshing) {
            [self setState:MJRefreshStateRefreshing];
        }
    }
}

#pragma mark 构造方法
- (instancetype)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        // 1.自己的属性
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
        
        //2.yiubook imageview设置
        _imageViewYiubook=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, SizeWidthYiubook, SizeHeigthYiubook)];
        _imageViewYiubook.image=[UIImage imageNamed:ImageYiubook];
        _imageViewYiubook.center=CGPointMake(self.frame.size.width/2,self.frame.size.height/2);
        _imageViewYiubook.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_imageViewYiubook];
        
        //3.head和footer的点动画
        _loadAnimationHeadView=[[LoadAnimation alloc]initYiubookViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _loadAnimationHeadView.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        _loadAnimationFooterView=[[LoadAnimation alloc]initDotLoadingWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _loadAnimationFooterView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_loadAnimationHeadView];
        [self addSubview:_loadAnimationFooterView];
        
        //4:是否显示底部的提示(默认不显示)
        self.isShowFooterTipView=NO;
    }
    return self;
}
#pragma mark 设置frame
- (void)setFrame:(CGRect)frame
{
    frame.size.height = self.RefreshViewHeight;
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds
{
    bounds.size.height = self.RefreshViewHeight;
    [super setBounds:bounds];
}
#pragma mark 设置UIScrollView
- (void)setScrollView:(UIScrollView *)scrollView
{
    // 移除之前的监听器
    [_scrollView removeObserver:self forKeyPath:MJRefreshContentOffset context:nil];
    // 监听contentOffset
    [scrollView addObserver:self forKeyPath:MJRefreshContentOffset options:NSKeyValueObservingOptionNew context:nil];
    
    // 设置scrollView
    _scrollView = scrollView;
    [_scrollView addSubview:self];
    if([_scrollView isKindOfClass:[UITableView class]]){
        ((UITableView *)_scrollView).tableFooterView.hidden=YES;
    }
}

#pragma mark 监听UIScrollView的contentOffset属性
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![MJRefreshContentOffset isEqualToString:keyPath]) return;
    
    if (!self.userInteractionEnabled || self.alpha <= 0.01 || self.hidden
        || _state == MJRefreshStateRefreshing) return;
    
    // scrollView所滚动的Y值 * 控件的类型（头部控件是-1，尾部控件是1）
    CGFloat offsetY = _scrollView.contentOffset.y * self.viewType;
    CGFloat validY = self.validY;
    if (offsetY <= validY) return;
    
    if (_scrollView.isDragging) {
        CGFloat validOffsetY = validY + self.RefreshViewHeight;
        if (_state == MJRefreshStatePulling && offsetY <= validOffsetY) {
            // 转为普通状态
            [self setState:MJRefreshStateNormal];
            // 通知代理
            if ([_delegate respondsToSelector:@selector(refreshView:stateChange:)]) {
                [_delegate refreshView:self stateChange:MJRefreshStateNormal];
            }
            
            // 回调
            if (_refreshStateChangeBlock) {
                _refreshStateChangeBlock(self, MJRefreshStateNormal);
            }
        } else if (_state == MJRefreshStateNormal && offsetY > validOffsetY) {
            // 转为即将刷新状态
            [self setState:MJRefreshStatePulling];
            // 通知代理
            if ([_delegate respondsToSelector:@selector(refreshView:stateChange:)]) {
                [_delegate refreshView:self stateChange:MJRefreshStatePulling];
            }
            
            // 回调
            if (_refreshStateChangeBlock) {
                _refreshStateChangeBlock(self, MJRefreshStatePulling);
            }
        }
    } else { // 即将刷新 && 手松开
        if (_state == MJRefreshStatePulling) {
            // 开始刷新
            [self setState:MJRefreshStateRefreshing];
            // 通知代理
            if ([_delegate respondsToSelector:@selector(refreshView:stateChange:)]) {
                [_delegate refreshView:self stateChange:MJRefreshStateRefreshing];
            }
            
            // 回调
            if (_refreshStateChangeBlock) {
                _refreshStateChangeBlock(self, MJRefreshStateRefreshing);
            }
        }
    }
}

#pragma mark 设置状态
- (void)setState:(MJRefreshState)state
{
    if (_state != MJRefreshStateRefreshing) {
        // 存储当前的contentInset
        _scrollViewInitInset = _scrollView.contentInset;
    }
    
    // 1.一样的就直接返回
    if (_state == state) return;
    
    // 2.根据状态执行不同的操作
    switch (state) {
        case MJRefreshStateNormal:
            // 说明是刚刷新完毕 回到 普通状态的
            if (MJRefreshStateRefreshing == _state) {
                // 通知代理
                if ([_delegate respondsToSelector:@selector(refreshViewEndRefreshing:)]) {
                    [_delegate refreshViewEndRefreshing:self];
                }
                
                // 回调
                if (_endStateChangeBlock) {
                    _endStateChangeBlock(self);
                }
            }
            
            break;
            
        case MJRefreshStatePulling:
            if([self.scrollView isKindOfClass:[UITableView class]]){
               ((UITableView *)self.scrollView).tableFooterView.hidden=YES;
            }
            break;
            
        case MJRefreshStateRefreshing:
            // 通知代理
            if ([_delegate respondsToSelector:@selector(refreshViewBeginRefreshing:)]) {
                [_delegate refreshViewBeginRefreshing:self];
            }
            
            // 回调
            if (_beginRefreshingBlock) {
                _beginRefreshingBlock(self);
            }
            break;
        default:
            break;
    }
    
    // 3.存储状态
    _state = state;
}

#pragma mark 是否正在刷新
- (BOOL)isRefreshing
{
    return MJRefreshStateRefreshing == _state;
}
#pragma mark 开始刷新
- (void)beginRefreshing
{
    if (self.window) {
        [self setState:MJRefreshStateRefreshing];
    } else {
        _state = MJRefreshStateWillRefreshing;
    }
}
#pragma mark 结束刷新
- (void)endRefreshing
{
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self setState:MJRefreshStateNormal];
        if(self.isShowFooterTipView){
            if([self.scrollView isKindOfClass:[UITableView class]]){
                ((UITableView *)self.scrollView).tableFooterView.hidden=NO;
            }
        }else{
            if([self.scrollView isKindOfClass:[UITableView class]]){
                ((UITableView *)self.scrollView).tableFooterView.hidden=YES;
            }
        }
    });
}

#pragma mark - 随便实现
- (CGFloat)validY { return 0;}
- (MJRefreshViewType)viewType {return MJRefreshViewTypeHeader;}
- (void)free
{
    [_scrollView removeObserver:self forKeyPath:MJRefreshContentOffset];
}
- (void)removeFromSuperview
{
    [self free];
    _scrollView = nil;
    [super removeFromSuperview];
}

- (void)endRefreshingWithoutIdle
{
    [self endRefreshing];
}

- (int)totalDataCountInScrollView
{
    int totalCount = 0;
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self.scrollView;
        
        for (int section = 0; section<tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    } else if ([self.scrollView isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self.scrollView;
        
        for (int section = 0; section<collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}
+(void)setRefreshViewHeight:(CGFloat)refreshViewHeight{
    self.RefreshViewHeight=refreshViewHeight;
}
@end