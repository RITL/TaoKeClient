//
//  TKLoadLocalCSSWebViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKShareWebViewController.h"
#import "TKGood.h"

NS_ASSUME_NONNULL_BEGIN

@class TKLoadLocalCSSWebViewController;

@interface TKLoadLocalScriptHandler : NSObject <WKScriptMessageHandler,TKScriptMessageHandler>

/// 响应的名字
@property (nonatomic, copy) NSString *name;

/// 绑定的控制器
@property (nonatomic, weak) TKLoadLocalCSSWebViewController *viewController;

@end


/// 加载本地CSS的webView
@interface TKLoadLocalCSSWebViewController : TKShareWebViewController

/// 存放的所需的本地数据
@property (nonatomic, strong, nullable)id <TKGood> good;

@end


NS_ASSUME_NONNULL_END
