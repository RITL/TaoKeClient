//
//  TKCategoryManager.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKCategoryTitle.h"

NS_ASSUME_NONNULL_BEGIN

/// 用于存储分类的单例
@interface TKCategoryManager : NSObject

/// 用于存储所有分类的数组
@property (nonatomic, copy, readonly)NSArray <id<TKCategoryTitle>> *categorys;

/// 单例对象
+ (instancetype)shareInstanced;

/// 进行存储分类
+ (void)saveCategorys:(NSArray <id<TKCategoryTitle>> *)categorys;

@end

NS_ASSUME_NONNULL_END
