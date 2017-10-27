//
//  TKSelectionPageViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKSelectionPageViewController.h"
#import "TKSelectionTableController.h"
#import "LLSegmentBar.h"

@interface TKSelectionPageViewController ()

@end

@implementation TKSelectionPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"discount_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchMessage)];
    
    self.segmentBar.buttonsMargin = TKScale(25);
    
    [self addSubViewControllers];
}


- (void)searchMessage
{
    [self sendMessageToPageManager:@{TKConstDictionaryKeyPlatform : TKConstDictionaryValueKeySearch}];
}


- (void)addSubViewControllers
{
    //精选
    TKSelectionTableController *selectionController = [TKSelectionTableController new];

    
    //福利
    TKGeneralTableViewController *welfareController = [TKGeneralTableViewController new];
    welfareController.request_url = TKBaseUrlAppendTo(@"/api.php?m=Api&c=Lp&a=getFubaonew");
    
    
    self.contentViewControllers = @[selectionController,welfareController];
    self.segmentBarTitles = @[@"精选",@"福包"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
