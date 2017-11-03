//
//  TKLoadLocalCSSWebViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKLoadLocalCSSWebViewController.h"
#import "TKNetWorkingManager.h"
#import "NSString+TKLoadLocalCSSWebViewController.h"

@implementation TKLoadLocalScriptHandler

- (instancetype)init
{
    if (self = [super init]) {
        
        self.name = @"tk_nativeTransTKGoodInfo";
    }
    
    return self;
}



- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSInteger i = 0;
}

@end



@interface TKLoadLocalCSSWebViewController()

/// 存储所有原本数据的信息
@property (nonatomic, copy)NSArray <NSDictionary *> *infos;

/// 进行转型的数据
@property (nonatomic, copy)NSArray <id<TKGood>> *goods;

@end

@implementation TKLoadLocalCSSWebViewController

- (void)loadPropertysAtInitialization
{
    [super loadPropertysAtInitialization];
    
    self.scriptMessageHandlers = @[[TKLoadLocalScriptHandler new]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.autoTitle = false;
    self.navigationItem.title = self.good.product_name;
//    self.webView.UIDelegate = self;
    
    //请求
    [self requestRecommendInfo];
}


- (NSString *)url
{
    return @"YES";
}


/// 重写requestUrl
- (void)requestUrl
{
    if (!self.good) {  return; }
    
    //获得Path
    NSString *html = [NSString tk_localHTML:self.good];
    
    //开始加载
    [self.webView loadHTMLString:html baseURL:NSBundle.mainBundle.resourceURL];
}


- (void)setInfos:(NSArray<NSDictionary *> *)infos
{
    _infos = infos.copy;
    
    //进行转型
    self.goods = [infos tk_map:^id _Nonnull(NSDictionary * _Nonnull item) {
        
        return TKEnityCreateWithData(item);
        
    }];
}


/// 请求猜你喜欢的信息
- (void)requestRecommendInfo
{
    if (!self.good) {  return; }
    
    //参数拼接
    NSDictionary *paramters = @{@"cid":self.good.cid,
                                @"goodid":self.good.goodid,
                                @"limit":@"8"
                                };
    
    //开始请求
    [TKNetWorkingManager requestWithUrlString:TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=m=api&c=index&a=getrelatedgoods&cid=1") Method:HTTP_GET Parameters:paramters success:^(NSDictionary *data) {
        
        self.infos = [data valueForKey:@"msg"];
        
        //获得html
        NSString *html = [self.goods tk_localHTML:self.good];
        
        //重新加载
        [self.webView loadHTMLString:html baseURL:NSBundle.mainBundle.resourceURL];
        
    } failure:^(NSError *error) {

    }];
}


- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    NSInteger i = 0;
    
    
    completionHandler();
}


@end
