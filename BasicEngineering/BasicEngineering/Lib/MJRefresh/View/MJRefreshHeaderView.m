//
//  MJRefreshHeaderView.m
//  MJRefresh
//
//  Created by mj on 13-2-26.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  下拉刷新

#import "MJRefreshConst.h"
#import "MJRefreshHeaderView.h"

@interface MJRefreshHeaderView()
@end

@implementation MJRefreshHeaderView

+ (instancetype)header:(CGFloat)refreshViewHeigth
{
    MJRefreshHeaderView *refreshHeaderView=[MJRefreshHeaderView alloc];
    [refreshHeaderView setRefreshViewHeight:refreshViewHeigth];
    return [refreshHeaderView init];
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        _loadAnimationHeadView.hidden=NO;
        _loadAnimationFooterView.hidden=YES;
        _imageViewYiubook.hidden=NO;
    }
    return self;
}
#pragma mark - UIScrollView相关
#pragma mark 重写设置ScrollView
- (void)setScrollView:(UIScrollView *)scrollView
{
    [super setScrollView:scrollView];
    
    // 1.设置边框
    self.frame = CGRectMake(0, - self.RefreshViewHeight, scrollView.frame.size.width, self.RefreshViewHeight);
}

#pragma mark 设置状态
- (void)setState:(MJRefreshState)state
{
    // 1.一样的就直接返回
    if (_state == state) return;
    
    // 3.调用父类方法
    [super setState:state];
    
    // 4.根据状态执行不同的操作
    switch (state) {
        case MJRefreshStatePulling: // 松开可立即刷新
        {
            _imageViewYiubook.hidden=NO;
            // 执行动画
            [UIView animateWithDuration:MJRefreshAnimationDuration animations:^{
                _imageViewYiubook.transform=CGAffineTransformMakeScale(1, 1);
                UIEdgeInsets inset = _scrollView.contentInset;
                inset.top = _scrollViewInitInset.top;
                _scrollView.contentInset = inset;
            } completion:^(BOOL finished) {
                if(!_imageViewYiubook.hidden)
                    _loadAnimationHeadView.hidden=NO;
            }];
            break;
        }
            
        case MJRefreshStateNormal: // 下拉可以刷新
        {
            // 执行动画
            [UIView animateWithDuration:MJRefreshAnimationDuration animations:^{
                _imageViewYiubook.transform=CGAffineTransformMakeScale(0.4, 0.4);
                _loadAnimationHeadView.alpha=0.0f;
                _imageViewYiubook.alpha=0.4f;
                UIEdgeInsets inset = _scrollView.contentInset;
                inset.top = _scrollViewInitInset.top;
                _scrollView.contentInset = inset;
            }completion:^(BOOL finished){
                _loadAnimationHeadView.hidden=YES;
                _imageViewYiubook.hidden=YES;
                _imageViewYiubook.alpha=1.0f;
                _loadAnimationHeadView.alpha=1.0f;
            }];
            break;
        }
            
        case MJRefreshStateRefreshing: // 正在刷新中
        {
            // 执行动画
            [UIView animateWithDuration:MJRefreshAnimationDuration animations:^{
                // 1.增加65的滚动区域
                UIEdgeInsets inset = _scrollView.contentInset;
                inset.top = _scrollViewInitInset.top + self.RefreshViewHeight;
                _scrollView.contentInset = inset;
                // 2.设置滚动位置
                _scrollView.contentOffset = CGPointMake(0, - _scrollViewInitInset.top - self.RefreshViewHeight);
            }];
            break;
        }
        default:
            break;
    }
}

#pragma mark - 在父类中用得上
// 合理的Y值(刚好看到下拉刷新控件时的contentOffset.y，取相反数)
- (CGFloat)validY
{
    return _scrollViewInitInset.top;
}

// view的类型
- (int)viewType
{
    return MJRefreshViewTypeHeader;
}
@end