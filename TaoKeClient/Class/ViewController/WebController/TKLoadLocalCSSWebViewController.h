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

@interface TKLoadLocalScriptHandler : NSObject <WKScriptMessageHandler,TKScriptMessageHandler>

@property (nonatomic, copy) NSString *name;

@end


/// 加载本地CSS的webView
@interface TKLoadLocalCSSWebViewController : TKShareWebViewController

/// 存放的所需的本地数据
@property (nonatomic, strong, nullable)id <TKGood> good;

@end


NS_ASSUME_NONNULL_END
