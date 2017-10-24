//
//  TKAllCategoryHeaderView.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKGood.h"

NS_ASSUME_NONNULL_BEGIN

@class TKCardCycleScrollView;

@interface TKAllCategoryHeaderView : UIView

/// 轮播
@property (nonatomic, strong) TKCardCycleScrollView * cycleView;

/// 更新banner
- (void)updateCycleItems:(NSArray<NSDictionary<TKGood> *>*)items;

@end

NS_ASSUME_NONNULL_END
