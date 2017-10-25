//
//  TKCardCycleCollectionCell.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/13.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 图片式的轮播图
@interface TKCardCycleCollectionCell : UICollectionViewCell

/// 背景图
@property (nonatomic, strong) UIImageView *backgroundImageView;

/// 展示图片的imageView
@property (nonatomic, strong) UIImageView *imageView;

/// 显示大标题
@property (nonatomic, strong) UILabel *titleLabel;

/// 显示阴影的view
@property (nonatomic, strong) UIView *shaowView;

/// 显示细节标题
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

NS_ASSUME_NONNULL_END
