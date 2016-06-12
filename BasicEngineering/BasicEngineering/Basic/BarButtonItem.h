//
//  BarButtonItem.h
//  QYGW
//
//  Created by 李小斌 on 14-4-10.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  创建Navgation上的按钮
 */
@interface BarButtonItem : UIBarButtonItem

+(BarButtonItem *) barItemWithImage:(UIImage *) image selectedImage: (UIImage *) image target:(id) target action:(SEL) action;

+(BarButtonItem *)barItemWithTitle:(NSString *)title image:(UIImage *)image isImageLeft:(BOOL)isImageLeft target:(id)target action:(SEL)action;

+(BarButtonItem *)barItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage isImageLeft:(BOOL)isImageLeft target:(id)target action:(SEL)action;

+(BarButtonItem *)barItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (void)setNormalImage:(UIImage *)image;

- (void)setSelectedImage:(UIImage *)image;

- (void)setCustomAction:(SEL)action;
@end
