//
//  TK_PYSearchViewModel.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/8.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TK_PYSearchViewModel.h"
#import "UISearchBar+TKCustomColor.h"
//#import "TKSearchDetailedViewController.h"
#import "TKNetWorkingManager.h"
#import "TKRuntimeTool.h"
#import <UIColor+ImageGenerate.h>
#import <objc/runtime.h>

@implementation TK_PYSearchViewModel

-(void)requestHotSearchMessage
{
//    [TKNetWorkingManager requestHotSearchMessageComplete:^(NSDictionary * _Nonnull info, NSString * _Nullable placeholder, NSDictionary * _Nonnull data) {
//
//        //获得数据数组
//        NSArray <NSDictionary *> *datas = [info valueForKey:@"data"];
//
//        //获得源数据
//        NSArray <NSString *> *names = [datas tk_map:^id _Nonnull(id _Nonnull dictionary) {
//
//            return [dictionary valueForKey:@"name"];
//        }];
//
//        //设置
////        ((PYSearchViewController *)self.viewController).hotSearches = names;
//
//    } failture:^(NSString * _Nonnull status, NSError * _Nullable error, NSString * _Nonnull errorMessage) {
//
//    }];
}

@end




@implementation PYSearchViewController (TKPYSearchViewModel)

+(void)load
{
    //方法转换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"tagDidCLick:"), NSSelectorFromString(@"tk_tagDidCLick:"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], sel_registerName("tableView:didSelectRowAtIndexPath:"), sel_registerName("tk_tableView:didSelectRowAtIndexPath:"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"dealloc"), NSSelectorFromString(@"tk_dealloc"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"setup"), NSSelectorFromString(@"tk_setup"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"viewWillAppear:"), NSSelectorFromString(@"tk_viewWillAppear:"));
        
        TK_swizzledInstanceSelector([PYSearchViewController class], NSSelectorFromString(@"searchBar:textDidChange:"), NSSelectorFromString(@"tk_searchBar:textDidChange:"));
        
    });
}



- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor orangeColor];
//    self.navigationController.navigationBar.translucent = false;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
    if (@available(iOS 11,*)) {
        
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    }
#endif
    
    self.delegate = self;
//    self.viewModel = [TK_PYSearchViewModel viewModelBindViewController:self];
//    [self.viewModel requestHotSearchMessage];
}


- (void)tk_viewWillAppear:(BOOL)animated
{
    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {
        
        //重新布置
        [super viewWillAppear:animated];
        
        // Adjust the view according to the `navigationBar.translucent`
        if (NO == self.navigationController.navigationBar.translucent) {
            
            //获得tableView
            UITableView *baseSearchTableView = [self valueForKey:@"baseSearchTableView"];
            
            //获得结果控制器
            UIViewController *searchSuggestionVC = [self valueForKey:@"searchSuggestionVC"];
            
            baseSearchTableView.contentInset = UIEdgeInsetsMake(0, 0, self.view.tk_originY, 0);
            searchSuggestionVC.view.frame = CGRectMake(0, 64 - self.view.tk_originY, self.view.tk_width, self.view.tk_height  + self.view.tk_originY);

            if (!objc_getAssociatedObject(self, _cmd)) {
                [self.navigationController.navigationBar setBackgroundImage:PYSEARCH_COLOR(249, 249, 249).jp_image forBarMetrics:UIBarMetricsDefault];
                objc_setAssociatedObject(self, _cmd, @"1", OBJC_ASSOCIATION_COPY_NONATOMIC);
            }
        }
        
    }else {
        
        [self tk_viewWillAppear:animated];
    }
}

- (void)tk_setup
{
    [self tk_setup];
    
    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {
        
        [self.searchBar tk_setSearchFont: TKUtilityFont(@"PingFangSC-Regular", 14)];
        [self.searchBar tk_setPlaceHolderFont:TKUtilityFont(@"PingFangSC-Regular", 14)];
    }
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    [btn addTarget:self action:NSSelectorFromString(@"cancelDidClick") forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:144.0/255.0 green:144.0/255.0 blue:144.0/255.0 alpha:1] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    //设置取消的样式
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}


- (void)tk_tagDidCLick:(UITapGestureRecognizer *)gr
{
    [self tk_tagDidCLick:gr];
    
    UILabel *label = (UILabel *)gr.view;
    NSInteger index = [self.hotSearches indexOfObject:label.text] + 1;
    
//    if (1 == label.tag) {//热门搜索
//
////        TKStatisticManagerClick(@"search_hot_click", @{@"index":@(index),@"text":label.text});
//    }
}



- (void)tk_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tk_tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    //进行统计
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *text = cell.textLabel.text;
    
    //进行统计
//    TKStatisticManagerClick(@"search_history_click", @{@"index":@(indexPath.row + 1),@"text":text});
}



- (void)tk_dealloc
{
    [self tk_dealloc];
    NSLog(@"%@ is dealloc",NSStringFromClass([self class]));
}



- (void)tk_searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self tk_searchBar:searchBar textDidChange:searchText];
    
//    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {
//
//        [searchBar tk_setSearchFont: TKUtilityFont(@"PingFangSC-Regular", 14)];
//    }
}



-(TK_PYSearchViewModel *)viewModel
{
    return objc_getAssociatedObject(self, _cmd);
}



-(void)setViewModel:(TK_PYSearchViewModel *)viewModel
{
    objc_setAssociatedObject(self, @selector(viewModel), viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


#pragma mark - getter



-(PYDidSearchBlock)didSearchBlock
{
    __weak typeof(self) weakSelf = self;
    
    return ^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText){
        
        
//        TKSearchDetailedViewController *viewController = [[self.childViewControllers tk_filter:^BOOL(UIViewController * _Nonnull item) {
//
//            return [item isKindOfClass:[TKSearchDetailedViewController class]];
//
//        }] tk_safeObjectAtIndex:0];
//
//
//        if (!viewController) {
//
//            //初始化vc
//            viewController = [TKSearchDetailedViewController viewController:^(__kindof TKSearchDetailedViewController * _Nonnull viewController) {
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
//
//                if (@available(iOS 11.0, *)) {
//
//                    CGFloat bottom = TK_iPhoneX ? 34 : 0;
//
//                    viewController.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, bottom, 0);
//
//                };
//#endif
//
//                [viewController setValue:searchText forKeyPath:@"viewModel.keywords"];
//            }];
//
//
//            //添加到当前视图
//            [weakSelf addChildViewController:viewController];
//            [weakSelf.view addSubview:viewController.view];
//            [weakSelf.view bringSubviewToFront:viewController.view];
//
//            viewController.view.frame =  CGRectMake(0, 0, searchViewController.view.py_width, searchViewController.view.py_height);
//        }
//
//        else {
//
//            //获得search
//            NSString *keywords = [viewController valueForKeyPath:@"viewModel.keywords"];
//
//            if ([keywords isEqualToString:searchText]) {
//
//                return ;//重复
//            }
//
//            viewController.tableViewModel.currentPage = 1;//重置数据源
//            [viewController setValue:searchText forKeyPath:@"viewModel.keywords"];
//            [viewController.mainTableView scrollsToTop];//滚动到顶部
//            [viewController.tableViewModel startRequestBaseMessage];//开始请求
//        }

    };
}



#pragma mark - PYSearchViewControllerDelegate

- (void)searchViewController:(PYSearchViewController *)searchViewController
         searchTextDidChange:(UISearchBar *)searchBar
                  searchText:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {//如果没有相关信息
        
//        //获得控制器
//        if (self.childViewControllers.count > 0) {
//
//
//            TKSearchDetailedViewController *viewController = [[self.childViewControllers tk_filter:^BOOL(UIViewController * _Nonnull item) {
//
//                return [item isKindOfClass:[TKSearchDetailedViewController class]];
//
//            }] tk_safeObjectAtIndex:0];
//
//
//            if (viewController) {
//
//                [viewController.view removeFromSuperview];
//                [viewController removeFromParentViewController];
//            }
//        }
    }
}

@end






