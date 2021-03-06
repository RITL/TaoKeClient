//
//  TKLoadLocalCSSWebViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKLoadLocalCSSWebViewController.h"
#import "TKPageManager.h"
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
    //获得index
    NSInteger index = [message.body integerValue];
    
    //获取真实数据
    NSDictionary *info = [self.viewController valueForKey:@"infos"][index];
    
    //进行数据传输
    [TKPageManager pageManagerFromObject:self.viewController info:@{TKPageManagerHandlerPlatformKey:TKConstDictionaryValueKeyLocalWeb,TKConstDictionaryKeyCategoryInfo:info}];
}

@end



@interface TKLoadLocalCSSWebViewController()

/// 存储所有原本数据的信息
@property (nonatomic, copy)NSArray <NSDictionary *> *infos;

/// 进行转型的数据
@property (nonatomic, copy)NSArray <id<TKGood>> *goods;

/// 领卷的响应
@property (nonatomic, strong) UIButton *getDiscount;

@end

@implementation TKLoadLocalCSSWebViewController

- (void)loadPropertysAtInitialization
{
    [super loadPropertysAtInitialization];
    
    TKLoadLocalScriptHandler *scriptHandler = [TKLoadLocalScriptHandler new];
    scriptHandler.viewController = self;
    
    self.scriptMessageHandlers = @[scriptHandler];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.autoTitle = false;
    self.navigationItem.title = self.good.product_name;
    
    self.getDiscount = ({
       
        UIButton *control = [UIButton new];
        
        control.backgroundColor = UIColor.redColor;
        control.titleLabel.font = TKUtilityFont(@"", TKScale(12));
        [control setTitle:@"领卷" forState:UIControlStateNormal];
        [control setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        
        control;
    });
    
    //追加响应
    
    
    [self.view addSubview:self.getDiscount];
    
    //进行布局
    [self.getDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(TKScale(50), TKScale(50)));
        make.right.offset(TKScale(-20));
        
        if (TK_iPhoneX) {
            //进行布局
            make.bottom.offset(-1 * TKScale(TK_iPhoneXSafeDistance + 30));
            
        }else {
            
            make.bottom.offset(-1 * TKScale(30));
        }

    }];
    
    //追加领券
    [self.getDiscount addTarget:self action:@selector(gotoGetDiscount) forControlEvents:UIControlEventTouchUpInside];
    
    //请求
    [self requestRecommendInfo];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.getDiscount.layer.cornerRadius = self.getDiscount.tk_width / 2.0;
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


#pragma mark - 领券

/// 前去领取
- (void)gotoGetDiscount
{
    //获得当前产品
    id <TKGood> good = self.good;
    
    //跳转领卷
    [TKPageManager pageManagerFromObject:self info:@{TKPageManagerHandlerPlatformKey:TKConstDictionaryValueKeyWeb,TKConstDictionaryKeyUrl:good.coupon_url}];
}


#pragma mark - delegate




@end
