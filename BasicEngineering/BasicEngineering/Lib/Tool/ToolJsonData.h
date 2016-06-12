//
//  ToolJsonData.h
//  YiuBook
//
//  Created by tusm on 15/5/23.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolJsonData : NSObject
+(id)getJsonArrayOrDictionByString:(NSString *)content;
@end
