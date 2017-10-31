//
//  TKLoadLocalCSSWebViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKLoadLocalCSSWebViewController.h"
#import "NSString+TKLoadLocalCSSWebViewController.h"

@implementation TKLoadLocalCSSWebViewController


- (NSString *)url
{
    return @"YES";
}


/// 重写requestUrl
- (void)requestUrl
{
    if (!self.good) {  return; }
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    
    NSString *test = [[NSBundle mainBundle] pathForResource:@"detailindex" ofType:@"css"];
    NSURL *testURL = test.tk_url;
    
    //获得基础的baseURL
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    //获得Path
    NSString *html = [NSString tk_localHTML:self.good];
    
    //开始加载
    [self.webView loadHTMLString:html baseURL:baseURL];
}





@end
