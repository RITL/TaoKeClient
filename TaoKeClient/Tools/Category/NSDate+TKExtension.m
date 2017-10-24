//
//  NSDate+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "NSDate+TKExtension.h"

@implementation NSDate (TKExtension)

+ (NSString *)tk_timeIntervalSince1970
{
    NSDate *date = [NSDate new];
    
    return [NSString stringWithFormat:@"%@",@(date.timeIntervalSince1970)];
}

@end
