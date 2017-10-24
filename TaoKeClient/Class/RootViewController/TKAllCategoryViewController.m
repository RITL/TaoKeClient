//
//  TKAllCategoryViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKAllCategoryViewController.h"
#import "TKAllCategoryHeaderView.h"
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
        view;
    });
    
    
    self.headerView.frame = CGRectMake(0, 0, self.tk_width, 206);
    self.tableView.tableHeaderView = self.headerView;
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.and.right.offset(0);
        make.height.mas_equalTo(400);
        
    }];
    
    [self requestBannerInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/// 请求轮播视图
- (void)requestBannerInfo
{
    [TKNetWorkingManager requestWithUrlString:TKBaseUrlAppendTo(@"/api.php?m=Api&http://fulihot.lixiaopeng.top/api.php?m=Api&c=Index&a=getindex") Method:HTTP_GET Parameters:nil success:^(NSDictionary *data) {
        
        NSInteger i = 0;
        
    } failure:^(NSError *error) {
        
        NSInteger i = 0;
        
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


@end
