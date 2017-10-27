//
//  TKGeneralLargeTableViewCell.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKBaseTableViewCell.h"
#import "TKGeneralLargeItem.h"

NS_ASSUME_NONNULL_BEGIN

/// 全局使用的每行1个Item的cell
@interface TKGeneralLargeTableViewCell : TKBaseTableViewCell

/// 仅存的一个item
@property (nonatomic, strong) TKGeneralLargeItem * item;

@end

NS_ASSUME_NONNULL_END
