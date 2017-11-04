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

@class TKCardCycleScrollView;

@protocol TKCardCycleScrollDelegate <NSObject>

@optional


/// 点击的位置
- (void)tk_cardCycleScrollView:(TKCardCycleScrollView *)scrollView
          didSelectItemAtIndex:(NSInteger)index;

@end


/// 搭载卡片式cell的轮播图
@interface TKCardCycleScrollView : UIView

/// 代理对象
@property (nonatomic, weak, nullable)id <TKCardCycleScrollDelegate> delegate;

/// 显示页码的标签
@property (nonatomic, strong) UIButton *pageLabel;

/// 进行滚动的集合视图的映射
@property (nonatomic, strong) UICollectionView *collectionView;

/// 进行赋值
@property (nonatomic, copy)NSArray <id <TKGood>> *items;

@end

NS_ASSUME_NONNULL_END
