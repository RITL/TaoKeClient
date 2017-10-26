//
//  TKWebViewController.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/6/30.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WKScriptMessageHandler;
@protocol WKNavigationDelegate;
@class TKWebViewController;

@protocol TKScriptMessageHandler <NSObject>

/// 注册的名字
@property (nonatomic, copy) NSString *name;


@end


typedef void(^TKWebControllerConfigHandler)(TKWebViewController *viewController);



/// 网页加载控制器
@interface TKWebViewController : TKViewController

/// 信息交互的handler
@property (nonatomic, copy, nullable)NSArray<id <WKScriptMessageHandler,TKScriptMessageHandler> > * scriptMessageHandlers;

/// 设置独立的代理
@property (nonatomic, weak, nullable)id <WKNavigationDelegate> navigationDelegate;

/// 网页加载的url
@property (nonatomic, copy, nullable) NSString *url;

/// 网页的标题
@property (nonatomic, copy, nullable) NSString *webTitle;

/// 是否抓取webView的title，默认为true
@property (nonatomic, assign) BOOL autoTitle;

/// 关闭的itemButton的图片
@property (nonatomic, strong) UIImage *closeImage;

/// 进度条视图
@property (nonatomic, strong) UIProgressView *progressView;


/**
 便利构造器

 @param configHandler 配合方法
 @return TKWebViewController对象
 */
+ (instancetype)tkWebControllerHandler:(TKWebControllerConfigHandler)configHandler;

@end

NS_ASSUME_NONNULL_END
