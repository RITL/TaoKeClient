//
//  TKAllCategoryViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKAllCategoryViewController.h"
#import "TKAllCategoryHeaderView.h"
#import "TKNormalTitleHeaderView.h"
#import "TKGeneralTableViewCell.h"
#import "TKNetWorkingManager.h"
#import "TKCategoryManager.h"
#import "UITableView+TKCellRegister.h"
#import <Masonry.h>

@interface TKAllCategoryViewController ()

/// 顶部的视图
@property (nonatomic, strong) TKAllCategoryHeaderView * headerView;

/// 请求的数据
@property (nonatomic, strong) NSMutableArray <NSDictionary *> *infos;
/// 进行包壳的字典数据
@property (nonatomic, copy, readonly)NSDictionary *infoMessage;

@end

@implementation TKAllCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.infos = [NSMutableArray arrayWithCapacity:100];
    
    self.headerView = ({
       
        TKAllCategoryHeaderView *view = [TKAllCategoryHeaderView new];
        view.backgroundColor = UIColor.whiteColor;
        view;
    });
    
    self.headerView.delegate = self;
    self.headerView.frame = CGRectMake(0, 0, self.tk_width, TKScale(265));
    self.tableView.tableHeaderView = self.headerView;
    
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.and.right.offset(0);
        make.bottom.offset(0);
        
    }];
    
    //注册所有的信息
    [self.tableView registerClass:TKNormalTitleHeaderView.class forHeaderFooterViewReuseIdentifier:@"TKNormalTitleHeaderView"];
    
    [self.tableView registerClass:TKGeneralTableViewCell.class forCellReuseIdentifier:@"TKGeneralTableViewCell"];
    
    [self requestBannerInfo];
    [self requestCategory];
    [self requestMessageComplete:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/// 请求轮播视图
- (void)requestBannerInfo
{
    [TKNetWorkingManager requestWithUrlString:TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=getindextui") Method:HTTP_GET Parameters:nil success:^(NSDictionary *data) {
        
        NSArray <NSDictionary *> *items = [data valueForKey:@"msg"];
        
        if (items) {
            
            NSArray <id <TKGood>> *tkGoods = [items tk_map:^id _Nonnull(NSDictionary * _Nonnull info) {
                
                return TKEnityCreateWithData(info);
            }];
            
            //更新
            [self.headerView updateCycleItems:tkGoods];
            
        }
        
        
    } failure:^(NSError *error) {
        
        
    }];
}


/// 请求分类
- (void)requestCategory
{
    [TKNetWorkingManager requestWithUrlString:TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=getTaokeCat&token=47ce3705d9eea09ae7addebdea25") Method:HTTP_GET Parameters:nil success:^(NSDictionary *data) {
        
        NSArray <NSDictionary *> *items = [data valueForKey:@"msg"];
        
        if (items) {
            
            NSArray <id <TKCategoryTitle>> *TKCategoryTitles = [items tk_map:^id _Nonnull(NSDictionary * _Nonnull info) {
                
                return TKEnityCreateWithData(info);
            }];
            
            //更新
            [self.headerView updateSegmentItems:TKCategoryTitles];
            
            //进行存储
            [TKCategoryManager saveCategorys:TKCategoryTitles];
        }
        
    } failure:^(NSError *error) {
        
    }];
}


/// 请求
- (void)requestMessageComplete:(void(^)(void))completeHandler
{
    [TKNetWorkingManager requestWithUrlString:TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=getdataoke") Method:HTTP_GET Parameters:@{@"limit":@"8",@"p":@(self.currentPage)} success:^(NSDictionary *data) {
        
        NSArray <NSDictionary *> *items = [data valueForKey:@"msg"];
        
        if (items) {
            
            self.currentPage ++;//当前页码追加
            
            if (completeHandler) { completeHandler(); }
            
            [self.infos addObjectsFromArray:items];
            
            [self.tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        
         if (completeHandler) { completeHandler(); }
    }];
}


#pragma mark - getter

- (NSDictionary *)infoMessage
{
    return @{@"msg":self.infos};
}


#pragma mark - refresh

- (BOOL)headerRefreshEnable
{
    return true;
}



- (void)headerRefreshBeginHandler
{
    __weak typeof(self) weakSelf = self;
    
    [self requestBannerInfo];
    
    //清空当前数组
    [self.infos removeAllObjects];
    self.currentPage = 1;
    [self requestMessageComplete:^{
       
        [weakSelf endHeaderRefreshing];
    }];
}




- (BOOL)footerRefreshEnable
{
    return true;
}




- (void)footerRefreshBeginHandler
{
    __weak typeof(self) weakSelf = self;
    
    [self requestMessageComplete:^{
        
        [weakSelf endFooterRefreshing];
        
    }];
}


#pragma mark - tableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = (self.infos.count % 2 == 0) ? self.infos.count / 2 : self.infos.count / 2 + 1;
    
    return numberOfRows;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGeneralTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TKGeneralTableViewCell" forIndexPath:indexPath];
    
    //获得当前的数据
    [cell updateViewByData:self.infoMessage indexPath:indexPath cellDelegate:self];
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGeneralTableViewCell *cell = [tableView tk_dequeueReusableCellWithIdentifier:@"TKGeneralTableViewCell" class:TKGeneralTableViewCell.class];
    
    return [cell prepareHeightByDict:nil indexPath:indexPath];
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TKNormalTitleHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TKNormalTitleHeaderView"];
    
    if (!headerView) {
        
        headerView = (TKNormalTitleHeaderView *)[[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
    }
    
    headerView.titleLabel.text = @"优惠券列表";
    
    return headerView;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return TKScale(40);
}


#pragma mark - TKAllCategoryHeaderDelegate


@end
