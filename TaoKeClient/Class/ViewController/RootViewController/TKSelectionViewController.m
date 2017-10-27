//
//  TKSelectionViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKSelectionViewController.h"
#import "LLSegmentBar.h"

@interface TKSelectionViewController ()

@end

@implementation TKSelectionViewController

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
    UIViewController *selectionController = [UIViewController new];
    selectionController.view.backgroundColor = UIColor.yellowColor;
    
    //福利
    UIViewController *welfareController = [UIViewController new];
    welfareController.view.backgroundColor = UIColor.orangeColor;
    
    
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
