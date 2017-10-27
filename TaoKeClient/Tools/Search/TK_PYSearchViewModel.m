//
//  TK_PYSearchViewModel.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/8.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TK_PYSearchViewModel.h"
#import "TKRuntimeTool.h"
#import "TKNetWorkingManager.h"
#import "TKGeneralTableViewController.h"
#import "UISearchBar+TKCustomColor.h"
#import <UIColor+ImageGenerate.h>
#import <objc/runtime.h>

@implementation TK_PYSearchViewModel

-(void)requestHotSearchMessage
{

}

@end




@implementation PYSearchViewController (TKPYSearchViewModel)

+(void)load
{
    //方法转换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

//        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"tagDidCLick:"), NSSelectorFromString(@"tk_tagDidCLick:"));
        
//        TK_swizzledInstanceSelector([PYSearchViewController class], sel_registerName("tableView:didSelectRowAtIndexPath:"), sel_registerName("tk_tableView:didSelectRowAtIndexPath:"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"dealloc"), NSSelectorFromString(@"tk_dealloc"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"setup"), NSSelectorFromString(@"tk_setup"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"viewWillAppear:"), NSSelectorFromString(@"tk_viewWillAppear:"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"searchBar:textDidChange:"), NSSelectorFromString(@"tk_searchBar:textDidChange:"));
        
    });
}



- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor orangeColor];
    

    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {
        
        if (@available(iOS 11,*)) {
            
            self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
        }
        
    }

    
    self.delegate = self;
}


- (void)tk_viewWillAppear:(BOOL)animated
{
    [self tk_viewWillAppear:animated];

    if (!objc_getAssociatedObject(self, _cmd)) {

        [self.navigationController.navigationBar setBackgroundImage:TKNavigationBarSearchBackgroundColor.jp_image forBarMetrics:UIBarMetricsDefault];

        objc_setAssociatedObject(self, _cmd, @"1", OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}



- (void)tk_setup
{
    [self tk_setup];
    
    [self.searchBar tk_setSearchFont: TKUtilityFont(@"PingFangSC-Regular", 14)];
    [self.searchBar tk_setPlaceHolderFont:TKUtilityFont(@"PingFangSC-Regular", 14)];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    [btn addTarget:self action:NSSelectorFromString(@"cancelDidClick") forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    //设置取消的样式
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}


//- (void)tk_tagDidCLick:(UITapGestureRecognizer *)gr
//{
//    [self tk_tagDidCLick:gr];
//
//    UILabel *label = (UILabel *)gr.view;
//    NSInteger index = [self.hotSearches indexOfObject:label.text] + 1;
//
//
//}



//- (void)tk_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self tk_tableView:tableView didSelectRowAtIndexPath:indexPath];
//
//    //进行统计
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *text = cell.textLabel.text;
//
//    //进行统计
////    TKStatisticManagerClick(@"search_history_click", @{@"index":@(indexPath.row + 1),@"text":text});
//}



- (void)tk_dealloc
{
    [self tk_dealloc];
    NSLog(@"%@ is dealloc",NSStringFromClass([self class]));
}



- (void)tk_searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self tk_searchBar:searchBar textDidChange:searchText];
    
    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {

        [searchBar tk_setSearchFont: TKUtilityFont(@"PingFangSC-Regular", 14)];
    }
}



-(TK_PYSearchViewModel *)viewModel
{
    if (!objc_getAssociatedObject(self, _cmd)) {
        
        self.viewModel = [TK_PYSearchViewModel new];
    }
    
    return objc_getAssociatedObject(self, _cmd);
}



-(void)setViewModel:(TK_PYSearchViewModel *)viewModel
{
    objc_setAssociatedObject(self, @selector(viewModel), viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - getter



-(PYDidSearchBlock)didSearchBlock
{
    __weak typeof(self) weakSelf = self;
    
    return ^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText){
        
        TKGeneralTableViewController *viewController = [[self.childViewControllers tk_filter:^BOOL(UIViewController * _Nonnull item) {

            return [item isKindOfClass:[TKGeneralTableViewController class]];

        }] tk_safeObjectAtIndex:0];

        
        if (!viewController) {

            //初始化vc
            viewController = [TKGeneralTableViewController viewController:^(__kindof TKGeneralTableViewController * _Nonnull viewController) {
                
                viewController.request_url = TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=c=Index&a=searchTaoKe");
                viewController.additionInfo = @{@"keyword":searchText,@"cid":@(-1)};
                
            }];

            weakSelf.viewModel.keywords = searchText;
            
            //添加到当前视图
            [weakSelf addChildViewController:viewController];
            [weakSelf.view addSubview:viewController.view];
            [weakSelf.view bringSubviewToFront:viewController.view];

            viewController.view.frame =  CGRectMake(0, 0, searchViewController.view.py_width, searchViewController.view.py_height);

        }

        else {

            //获得search
            NSString *keywords = self.viewModel.keywords;

            if ([keywords isEqualToString:searchText]) {

                return ;//重复
            }

            weakSelf.viewModel.keywords = searchText;
            [viewController.tableView setContentOffset:CGPointMake(0, 0)];//滚动到顶部
            viewController.additionInfo = @{@"keyword":weakSelf.viewModel.keywords,@"cid":@(-1)};//重新设置搜索关键词
            [viewController headerRefreshBeginHandler];//开始请求
        }

    };
}



#pragma mark - PYSearchViewControllerDelegate

- (void)searchViewController:(PYSearchViewController *)searchViewController
         searchTextDidChange:(UISearchBar *)searchBar
                  searchText:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {//如果没有相关信息
        //获得控制器
        if (self.childViewControllers.count > 0) {

            TKGeneralTableViewController *viewController = [[self.childViewControllers tk_filter:^BOOL(UIViewController * _Nonnull item) {

                return [item isKindOfClass:[TKGeneralTableViewController class]];

            }] tk_safeObjectAtIndex:0];


            if (viewController) {

                [viewController.view removeFromSuperview];
                [viewController removeFromParentViewController];
            }
        }
    }
}

@end






