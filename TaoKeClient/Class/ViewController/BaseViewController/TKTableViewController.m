//
//  TKTableViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKTableViewController.h"
#import "TKPageManager.h"
#import <Masonry.h>

@interface TKTableViewController ()

@end

@implementation TKTableViewController

- (instancetype)init
{
    if (self = [super init]) {
        
        self.currentPage = 1;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tableView = ({
       
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.backgroundColor = UIColor.whiteColor;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.showsVerticalScrollIndicator = false;
        tableView.showsHorizontalScrollIndicator = false;
        
        tableView;
    });
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.offset(0);
        
    }];
    

    [self tk_addRefreshComponent];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [TKPageManager sharedInstance].currentViewController = self;
}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


#pragma mark - 上拉下拉刷新
#pragma mark - 刷新

/// 添加刷新组件
- (void)tk_addRefreshComponent
{
    [self installAllRefresh];
}


-(void)installHeaderRefresh
{
    if (!self.tableView.mj_header && self.headerRefreshEnable) {
        
        self.tableView.mj_header = self.refreshHeader;
        
    }
}


-(void)installFooterRefresh
{
    if (!self.tableView.mj_footer && self.footerRefreshEnable) {
        
        self.tableView.mj_footer = self.refreshFooter;
    }
}


-(void)installAllRefresh
{
    [self installHeaderRefresh];
    [self installFooterRefresh];
}


-(void)unstallHeaderRefresh
{
    if (self.tableView.mj_header) {
        
        self.tableView.mj_header = nil;
        [self.tableView.mj_header removeFromSuperview];
    }
}



-(void)unstallFooterRefresh
{
    if (self.tableView.mj_footer) {
        
        self.tableView.mj_footer = nil;
        [self.tableView.mj_footer removeFromSuperview];
    }
}


-(void)unstallAllRefresh
{
    [self unstallHeaderRefresh];
    [self unstallFooterRefresh];
}



- (BOOL)headerRefreshEnable
{
    return false;
}


- (BOOL)footerRefreshEnable
{
    return false;
}


- (Class)classForRefreshHeader
{
    return [MJRefreshNormalHeader class];
}


- (Class)classForRefreshFooter
{
    return [MJRefreshBackStateFooter class];
}


- (void)headerRefreshBeginHandler
{
    
}


- (void)footerRefreshBeginHandler
{
    
}



- (void)endHeaderRefreshing
{
    if (self.tableView.mj_header && self.tableView.mj_header.isRefreshing) {
        
        [self.refreshHeader endRefreshing];
    }
}



- (void)endFooterRefreshing
{
    if (self.tableView.mj_footer && self.tableView.mj_footer.isRefreshing) {
        
        [self.refreshFooter endRefreshing];
    }
}



-(MJRefreshGifHeader *)refreshHeader
{
    if (!_refreshHeader) {
        
        __weak typeof(self) weakSelf = self;
        
        //初始化
        _refreshHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            
            [weakSelf headerRefreshBeginHandler];
            
        }];
        
        _refreshHeader.lastUpdatedTimeLabel.hidden = true;
        _refreshHeader.stateLabel.hidden = false;
        
//        [_refreshHeader setImages:@[[UIImage imageNamed:@"refresh_default"]] forState:MJRefreshStateIdle];
//        [_refreshHeader setImages:@[[UIImage imageNamed:@"refresh_default"]] forState:MJRefreshStatePulling];
//        [_refreshHeader setImages:@[[UIImage imageNamed:@"refresh_default"]] forState:MJRefreshStateRefreshing];
        
    }
    return _refreshHeader;
}




-(MJRefreshBackStateFooter *)refreshFooter
{
    if (!_refreshFooter) {
        
        __weak typeof(self) weakSelf = self;
        
        _refreshFooter = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            
            [weakSelf footerRefreshBeginHandler];
            
        }];
        
        _refreshFooter.stateLabel.font = [UIFont systemFontOfSize:12];
        _refreshFooter.stateLabel.textColor = TKColorFromRGB(0xB9B9B9);
        [_refreshFooter setTitle:self.titleForFooterRefreshWithNoMoreData forState:MJRefreshStateNoMoreData];
    }
    
    return _refreshFooter;
}




-(NSString *)titleForFooterRefreshWithNoMoreData
{
    if (!_titleForFooterRefreshWithNoMoreData) {
        
        return @"-----更多内容，敬请期待-----";
    }
    
    return _titleForFooterRefreshWithNoMoreData;
}


@end
