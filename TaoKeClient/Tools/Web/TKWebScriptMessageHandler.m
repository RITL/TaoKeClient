//
//  TKWebScriptMessageHandler.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/8/30.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKWebScriptMessageHandler.h"
#import "TKPageManager.h"

@implementation TKWebScriptMessageHandler

- (NSString *)name
{
    if (!_name) {
        
        _name = @"onJsCallBack";
    }
    
    return _name;
}



- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    //获得body体
    NSDictionary *body = message.body;
    
//    NSLog(@"JS call back = %@",body);
    
    [TKPageManager pageManagerFromObject:message.webView info:body];
}


- (void)dealloc
{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

@end
