//
//  LLSegmentBar+TKExtension.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "LLSegmentBar.h"
#import "TKCategoryTitle.h"

NS_ASSUME_NONNULL_BEGIN

///
@interface LLSegmentBar (TKExtension)

/// 映射indicatorView
@property (nonatomic, strong, readonly)UIView *tk_map_indicatorView;

/// 设置响应的title
@property (nonatomic, copy)NSArray <id<TKCategoryTitle>> *titleItems;

@end

NS_ASSUME_NONNULL_END
