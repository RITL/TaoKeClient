//
//  TKSelectionTableController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKSelectionTableController.h"
#import "TKGeneralLargeTableViewCell.h"
#import "UITableView+TKCellRegister.h"

@interface TKSelectionTableController ()

@end

@implementation TKSelectionTableController

- (void)loadPropertysAtInitialization
{
    [super loadPropertysAtInitialization];
    
    //注册cell
    [self.tableView registerClass:TKGeneralLargeTableViewCell.class forCellReuseIdentifier:@"TKGeneralLargeTableViewCell"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)request_url
{
    return TKBaseUrlAppendTo(@"/api.php?m=Api&c=Lp&a=getJingxuan");
}


#pragma mark - tableView DataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infos.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGeneralLargeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TKGeneralLargeTableViewCell" forIndexPath:indexPath];
    
    //获得当前的数据
    [cell updateViewByData:self.infoMessage indexPath:indexPath cellDelegate:self];
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKGeneralLargeTableViewCell *cell = [tableView tk_dequeueReusableCellWithIdentifier:@"TKGeneralLargeTableViewCell" class:TKGeneralLargeTableViewCell.class];
    
    return [cell prepareHeightByDict:nil indexPath:indexPath];
}


@end
