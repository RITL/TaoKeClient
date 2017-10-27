//
//  TKGeneralTableViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKTableViewController.h"
#import "TKNetWorkingManager.h"

NS_ASSUME_NONNULL_BEGIN

/// 通用的上下拉刷新全局tableViewController,符合某个固定数据结构的固定控制器
@interface TKGeneralTableViewController : TKTableViewController

/// 请求的url,默认为nil
@property (nonatomic, copy, nullable)NSString *request_url;

/// 请求的方式,默认为GET
@property (nonatomic, assign)HTTPMethod method;

/// 请求的附加参数，默认为nil
@property (nonatomic, copy, nullable)NSDictionary *additionInfo;

@end

NS_ASSUME_NONNULL_END
