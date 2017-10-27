//
//  TK_PYSearchViewModel.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/8.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <PYSearch/PYSearchViewController.h>

NS_ASSUME_NONNULL_BEGIN


/// 嵌入PYSearchViewController的viewModel
@interface TK_PYSearchViewModel : NSObject

/// 搜索的关键词
@property (nonatomic, copy)NSString *keywords;

/// 请求热搜
- (void)requestHotSearchMessage;

@end



@interface PYSearchViewController (TKPYSearchViewModel)<PYSearchViewControllerDelegate>


/// 进行嵌入管理的viewModel
@property (nonatomic, strong) TK_PYSearchViewModel *viewModel;


@end


NS_ASSUME_NONNULL_END
