//
//  TKCategoryManager.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKCategoryManager.h"

@interface TKCategoryManager()

@property (nonatomic, copy, readwrite)NSArray <id<TKCategoryTitle>> *categorys;

@end

@implementation TKCategoryManager

+ (instancetype)shareInstanced
{
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [self new];
    });
    
    return manager;
}



+ (void)saveCategorys:(NSArray<id<TKCategoryTitle>> *)categorys
{
    if (!categorys) { return; }
    
    [self.shareInstanced setValue:categorys forKey:@"categorys"];
}

@end
