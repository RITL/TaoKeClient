//
//  NSDictionary+TKIdentifier.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "NSDictionary+TKIdentifier.h"
#import "TKRuntimeTool.h"

@implementation NSDictionary (TKIdentifier)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        TK_swizzledInstanceSelector(self.class,@selector(setValue:forKey:), @selector(tk_setValue:forkey:));
        
        
    });
}


- (void)tk_setValue:(id)value forkey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {//替换掉当前key中的id
        
        key = @"identifier";
    }
    
    [self tk_setValue:value forkey:key];
}


@end
