//
//  ToolColor.h
//  EnterpriseWeb
//
//  Created by 李小斌 on 14-5-28.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import <Foundation/Foundation.h>

//设置RGB颜色值
#define COLOR(R,G,B,A)	[UIColor colorWithRed:(CGFloat)R/255 green:(CGFloat)G/255 blue:(CGFloat)B/255 alpha:A]


#pragma 常用颜色
//白色
#define ColorWhite  [ToolColor colorWithHexString:@"#ffffff"]

//Nav标题字体或标题字体颜色（黑色）
#define ColorNavTitle [ToolColor colorWithHexString:@"#222222"]

//控制器主背景色（淡灰色）
#define ColorBGGray [ToolColor colorWithHexString:@"#eff0f4"]

//白色按钮高亮时颜色
#define ColorBtnWhiteHighlight [ToolColor colorWithHexString:@"#f8f8f8"]

//正文字体颜色
#define ColorTextContent [ToolColor colorWithHexString:@"#333333"]

//辅助字体颜色（淡黑色）
#define ColorTextVice [ToolColor colorWithHexString:@"#999999"]

//分隔线颜色
#define ColorLine [ToolColor colorWithHexString:@"#dcdee4"]


/**
 *  颜色工具类
 */
@interface ToolColor : NSObject
/**
 *  颜色转换 IOS中十六进制的颜色转换为UIColor
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+ (UIColor *) colorWithHexString: (NSString *)color;
@end
