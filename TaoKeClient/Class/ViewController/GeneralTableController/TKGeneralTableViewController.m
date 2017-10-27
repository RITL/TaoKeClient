//
//  TKGeneralTableViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKGeneralTableViewController.h"
#import "TKGeneralTableViewCell.h"
#import "UITableView+TKCellRegister.h"


@interface TKGeneralTableViewController ()

/// 请求的数据
@property (nonatomic, strong, readwrite) NSMutableArray <NSDictionary *> *infos;


@end

@implementation TKGeneralTableViewController

- (void)loadPropertysAtInitialization
{
    [super loadPropertysAtInitialization];
 
    //注册cell
    [self.tableView registerClass:TKGeneralTableViewCell.class forCellReuseIdentifier:@"TKGeneralTableViewCell"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.infos = [NSMutableArray arrayWithCapacity:100];
    

    
    //进行网络请求
    [self requestMessageComplete:nil dataComplete:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestMessageComplete:(void(^)(void))completeHandler dataComplete:(void(^)(void))dataComplete
{
    if (!self.request_url) {  return;  }
    
    NSMutableDictionary *constInfo = [NSMutableDictionary dictionaryWithDictionary: @{@"limit":@"8",@"p":@(self.currentPage)}];
    
    if (self.additionInfo) {
        
        [constInfo addEntriesFromDictionary:self.additionInfo];
    }
    
    //进行请求
    [TKNetWorkingManager requestWithUrlString:self.request_url Method:self.method Parameters:constInfo.mutableCopy success:^(NSDictionary *data) {
        
        NSArray <NSDictionary *> *items = [data valueForKey:@"msg"];
        
        if (items) {
            
            self.currentPage ++;//当前页码追加
            
            if (completeHandler) { completeHandler(); }
            if (dataComplete) { dataComplete(); }
            
            [self.infos addObjectsFromArray:items];
            
            [self.tableView reloadData];
        }
        
        
    } failure:^(NSError *error) {
        
         if (completeHandler) { completeHandler(); }
    }];
}

#pragma mark - refresh

- (BOOL)headerRefreshEnable
{
    return true;
}



- (void)headerRefreshBeginHandler
{
    __weak typeof(self) weakSelf = self;
    
    //清空当前数组
    
    self.currentPage = 1;
    [self requestMessageComplete:^{
        
        [weakSelf endHeaderRefreshing];
        
    } dataComplete:^{
        
        [self.infos removeAllObjects];
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
        
    } dataComplete:nil];
}



#pragma mark - getter

- (NSDictionary *)infoMessage
{
    return @{@"msg":self.infos};
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



@end
