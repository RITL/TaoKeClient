//
//  TKTableViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"

NS_ASSUME_NONNULL_BEGIN
/// 淘客的基础列表控制器
@interface TKTableViewController : TKViewController <UITableViewDelegate,UITableViewDataSource>

/// 列表视图
@property (nonatomic, strong) UITableView *tableView;


@end

NS_ASSUME_NONNULL_END
