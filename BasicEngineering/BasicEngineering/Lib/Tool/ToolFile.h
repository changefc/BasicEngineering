//
//  ToolFile.h
//  YiuBook
//
//  Created by tusm on 15/8/31.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ToolFile : NSObject
+(BOOL)fileIsExist:(NSString *)file ToCreate:(BOOL)isCreate;
+(BOOL)saveImage:(UIImage *)image  toFile:(NSString *)fileName;
+(NSString *)getRootDir;
+(NSString *)getCachePath;
+(NSString *)creatSaveFilePath:(NSString *)fileName;
+(NSString *)creatCacheFilePathRandom;
@end
