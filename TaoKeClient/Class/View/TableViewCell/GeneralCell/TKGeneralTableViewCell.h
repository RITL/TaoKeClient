//
//  TKGeneralTableViewCell.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKBaseTableViewCell.h"
#import "TKGeneralItem.h"

NS_ASSUME_NONNULL_BEGIN


/// 全局使用的每行两个Item的cell
@interface TKGeneralTableViewCell : TKBaseTableViewCell

@property (nonatomic, strong)TKGeneralItem *leftGeneralItem;
@property (nonatomic, strong)TKGeneralItem *rightGeneralItem;

@end

NS_ASSUME_NONNULL_END
