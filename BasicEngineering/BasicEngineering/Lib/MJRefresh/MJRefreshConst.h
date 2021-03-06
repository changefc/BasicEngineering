//
//  MJRefreshConst.h
//  MJRefresh
//
//  Created by mj on 14-1-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define MJLog(...) NSLog(__VA_ARGS__)
#else
#define MJLog(...)
#endif

// 文字颜色
#define MJRefreshLabelTextColor [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0]

extern const CGFloat MJRefreshAnimationDuration;
extern const CGFloat SizeWidthYiubook;
extern const CGFloat SizeHeigthYiubook;
extern const CGFloat padding;
extern NSString *const ImageYiubook;
extern NSString *const MJRefreshContentOffset;
extern NSString *const MJRefreshContentSize;