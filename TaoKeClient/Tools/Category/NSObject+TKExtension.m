//
//  NSObject+TKExtension.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/11.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "NSObject+TKExtension.h"

@implementation NSObject (TKExtension)


+ (instancetype)tk_object:(void (^)(__kindof id _Nonnull))initialHandler
{
    id object = [self new];
    
    initialHandler(object);
    
    return object;
}

@end
