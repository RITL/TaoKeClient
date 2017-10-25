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
#import "TKNetWorkingManager.h"
#import <Masonry.h>

@interface TKAllCategoryViewController ()

/// 顶部的视图
@property (nonatomic, strong) TKAllCategoryHeaderView * headerView;

@end

@implementation TKAllCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.headerView = ({
       
        TKAllCategoryHeaderView *view = [TKAllCategoryHeaderView new];
        view.backgroundColor = UIColor.whiteColor;
        view;
    });
    
    
    self.headerView.frame = CGRectMake(0, 0, self.tk_width, TKScale(265));
    self.tableView.tableHeaderView = self.headerView;
    
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.and.right.offset(0);
        make.bottom.offset(0);
        
    }];
    
    //注册所有的信息
    [self.tableView registerClass:TKNormalTitleHeaderView.class forHeaderFooterViewReuseIdentifier:@"TKNormalTitleHeaderView"];
    
    
    [self requestBannerInfo];
    [self requestCategory];
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
        }
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - tableView dataSource

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


@end
