//
//  TKCategoryTitle.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 分类的标题
@protocol TKCategoryTitle <NSObject>

/// 分类id
@property (nonatomic, copy, nullable) NSString *cid;
/// 分类名称
@property (nonatomic, copy, nullable) NSString *cname;
/// 分类状态
@property (nonatomic, copy, nullable) NSString *status;
/// 分类排序
@property (nonatomic, copy, nullable) NSString *sort;

@end

NS_ASSUME_NONNULL_END
