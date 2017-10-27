//
//  TKViewController+TKPageManagerBridge.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/26.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"
#import "TKBaseTableViewCell.h"
#import "TKAllCategoryHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

/// 履行各种跳转协议
@interface TKViewController (TKPageManagerBridge) <TKBaseTableViewCellDelegate,TKAllCategoryHeaderDelegate>



/**
 使用PageManager进行数据操作

 @param info 所涵盖的数据信息
 */
- (void)sendMessageToPageManager:(NSDictionary *)info;


@end

NS_ASSUME_NONNULL_END
