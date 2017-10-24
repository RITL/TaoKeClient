//
//  TKCardCycleScrollView.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/13.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKGood.h"

NS_ASSUME_NONNULL_BEGIN

/// 搭载卡片式cell的轮播图
@interface TKCardCycleScrollView : UIView

/// 显示页码的标签
@property (nonatomic, strong) UIButton *pageLabel;

/// 进行滚动的集合视图的映射
@property (nonatomic, strong) UICollectionView *collectionView;

/// 进行赋值
@property (nonatomic, copy)NSArray <NSDictionary<TKGood> *> *items;

@end

NS_ASSUME_NONNULL_END
