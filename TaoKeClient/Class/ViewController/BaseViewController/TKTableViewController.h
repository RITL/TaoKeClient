//
//  TKTableViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"
#import "TKRefreshGifHeader.h"

NS_ASSUME_NONNULL_BEGIN
/// 淘客的基础列表控制器
@interface TKTableViewController : TKViewController <UITableViewDelegate,UITableViewDataSource>

/// 列表视图
@property (nonatomic, strong) UITableView *tableView;




#pragma mark - 上拉下拉刷新

/// 当前页码，默认为0
@property (nonatomic, assign) NSInteger currentPage;

/// 下拉组件
@property (nonatomic, strong) TKRefreshGifHeader *refreshHeader;
/// 上拉加载组件
@property (nonatomic, strong) MJRefreshBackStateFooter *refreshFooter;


/// 是否使用下拉组件
-(BOOL)headerRefreshEnable;
/// 是否使用上拉组件
-(BOOL)footerRefreshEnable;


/// 下拉组件开始
- (void)headerRefreshBeginHandler;

/// 上拉组件开始
- (void)footerRefreshBeginHandler;


/// 结束下拉刷新
- (void)endHeaderRefreshing;

/// 结束上拉加载
- (void)endFooterRefreshing;


/// 装载刷新
- (void) installHeaderRefresh;
- (void) installFooterRefresh;
- (void) installAllRefresh;

/// 卸载刷新
- (void) unstallHeaderRefresh;
- (void) unstallFooterRefresh;
- (void) unstallAllRefresh;


/// 没有更多信息显示字符串
@property (nonatomic, copy) NSString *titleForFooterRefreshWithNoMoreData;


@end

NS_ASSUME_NONNULL_END
