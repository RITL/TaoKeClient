//
//  TKCategoryViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKGeneralTableViewController.h"
#import "TKCategoryTitle.h"

NS_ASSUME_NONNULL_BEGIN

/// 分类详情界面
@interface TKCategoryViewController : TKGeneralTableViewController

/// 当前分类界面分类
@property (nonatomic, strong) id <TKCategoryTitle> category;


@end

NS_ASSUME_NONNULL_END
