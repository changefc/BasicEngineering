//
//  ToolJsonData.m
//  YiuBook
//
//  Created by tusm on 15/5/23.
//  Copyright (c) 2015年 yiubook. All rights reserved.
//

#import "ToolJsonData.h"
@interface ToolJsonData()

@end
@implementation ToolJsonData

-(id)init{
    self=[super init];
    if(self){
        
    }
    return self;
}

/**
 *  json字符串转为NSArray或NSDictionary
 *
 *  @param content <#content description#>
 *
 *  @return <#return value description#>
 */
+(id)getJsonArrayOrDictionByString:(NSString *)content{
    NSError *error;
    id arrayJson = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
    if(error){
        NSLog(@"error:%@",error);
    }
    return arrayJson;
}
@end
