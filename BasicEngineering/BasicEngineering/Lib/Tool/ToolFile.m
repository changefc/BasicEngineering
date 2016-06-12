//
//  ToolFile.m
//  YiuBook
//
//  Created by tusm on 15/8/31.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ToolFile.h"

@implementation ToolFile
/**
 *  获取沙盒主目录路径
 */
+(NSString *)getHomeDoc{
    return NSHomeDirectory();
}
/**
 *  获取Documents目录路径
 */
+(NSString *)getDocumentDoc{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
/**
 *  获取Caches目录路径
 */
+(NSString *)getCaches{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}
// 获取tmp目录路径
+(NSString *)getTempDir{
    return  NSTemporaryDirectory();
}

/**
 *  创建一个保存文件的路径
 */
+(NSString *)creatSaveFilePath:(NSString *)fileName{
    return [[ToolFile getRootDir] stringByAppendingPathComponent:fileName];
}
@end
