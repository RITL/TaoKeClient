//
//  NSString+TKLoadLocalCSSWebViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "NSString+TKLoadLocalCSSWebViewController.h"

@implementation NSString (TKLoadLocalCSSWebViewController)

+ (NSString *)tk_localHTML:(id<TKGood>)good
{
    if (!good) {    return @"";  }
    
    return [NSString stringWithFormat:@"\
            \
            <html>\
            <head>\
            <meta name=\"applicable-device\" content=\"mobile\">\
            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\
            <meta charset=\"utf-8\">\
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\
            \
            <script src=\"https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js\"></script>\
            <script src=\"tk_nativeTrans.js\" type=\"text/javascript\"></script>\
            <link href=\"detailindex.css\" rel=\"stylesheet\" type=\"text/css\" />\
            <link href=\"iconfont.css\" rel=\"stylesheet\" type=\"text/css\" />\
            <body class=\"notop\">\
            \
            \
            <section class=\"block info\">\
            <div class=\"litercoloum\"></div>\
            <h1 class=\"row\">%@</h1>\
            <span class=\"pricetext\" style=\"color:gray;\">原价<s>¥%@</s></span>\
            <span class=\"pricetext\">%@元券（券后%@元）</span>\
            <div class=\"row\">\
            <ul class=\"collect\"></ul>\
            <div style=\"clear:both;\"></div>\
            </div>\
            <div class=\"row\"><span class=\"row globalbuy\">截止  | %@</span>\
            <div style=\"clear:both;\"></div>\
            </div>\
            </section>\
            \
            <section class=\"block\" style=\"border-top: 1px solid #d6d6d6;\">\
            \
            <div class=\"row-content prodetail\">\
            <p>%@</p>\
            <p><img src=\"%@\"></p>\
            </div>\
            \
            \
            </section>\
            \
            </body>\
            </html>\
            \
            ",good.product_name,
            good.product_pure_provice,
            good.coupon_denomination,
            good.pure_provice,
            good.coupon_end.tk_AutoDiscriminatingTodayDate,
            good.introduce,
            good.product_main_image];
}






+ (NSString *)tk_localHTMLSimilarRecommend:(id<TKGood>)good
{
    if (!good) {    return @"";  }
    
    //转成字符串
    NSDictionary *infoMessage = good.proxy_real_enity;
    
    NSDictionary *testDict = @{
        @"serverId" : @"108",
        @"roleId" : @"1001",
        @"roleVip" : @"A",
        @"appUId" : @"100702140113",
        @"roleName" : @"洪荒之剑",
        @"roleLevel" : @"A",
        @"serverName" : @"展游服务器"
        };
    
    //进行
    NSString *jsonString = testDict.tk_javascript_json;
    
//    infoMessage.tk_javascript_json;
    
    id object = [NSString stringWithFormat:@"\
            <li>\
            <a class=\"DisBlock\" style=\"text-decoration: none; \" href=\"javascript:;\" onclick=\"tk_nativeDidClick('%@')\" title=\"%@\">\
            <div class=\"relatepic\">\
            <img src=\"%@\">\
            </div>\
            <div class=\"relateinfo\">\
            <h3 class=\"\">%@</h3>\
            <span class=\"promoinfo\" style=\"\
            padding: 2px 0;\
            color: #d22222;\
            line-height: 18px;\
            font-size: 13px;\
            white-space: nowrap;\
            text-overflow: ellipsis;\
            text-decoration: none;\
            overflow: hidden;\">%@元券</span>\
            <div class=\"\">\
            <ul class=\"ref-row\" style=\"list-style: none;\
            margin: 0;\
            padding: 0;\
            vertical-align: baseline;\">\
            <li class=\"left\">截止 %@</li>\
            <li class=\"right\">\
            </li>\
            </ul>\
            </div>\
            <div class=\"row\">\
            <span class=\"price-small\"></span>\
            </div>\
            </div>\
            <div style=\"clear:both\"></div>\
            </a>\
            </li>\
            ",
            [NSString stringWithFormat:@"%@",@"去你的"],
            good.product_name,
            good.product_main_image,
            good.product_name,
            good.coupon_denomination,
            good.coupon_end.tk_AutoDiscriminatingTodayDate];
    
    return object;
}

@end


@implementation NSArray (TKLoadLocalCSSWebViewController)


- (NSString *)tk_localHTML:(id<TKGood>)good
{
    if (!good) {    return @"";  }
    
    NSMutableString *html = [NSMutableString string];
    
    /// 拼接基础html
    [html appendFormat:@"\
            \
            <html>\
            <head>\
            <meta name=\"applicable-device\" content=\"mobile\">\
            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\
            <meta charset=\"utf-8\">\
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\
            \
            <script src=\"https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js\"></script>\
            <script type=\"text/javascript\" src=\"tk_nativeTrans.js\"></script>\
            <link href=\"detailindex.css\" rel=\"stylesheet\" type=\"text/css\" />\
            <link href=\"iconfont.css\" rel=\"stylesheet\" type=\"text/css\" />\
            <body class=\"notop\">\
            \
            \
            <section class=\"block info\">\
            <div class=\"litercoloum\"></div>\
            <h1 class=\"row\">%@</h1>\
            <span class=\"pricetext\" style=\"color:gray;\">原价<s>¥%@</s></span>\
            <span class=\"pricetext\">%@元券（券后%@元）</span>\
            <div class=\"row\">\
            <ul class=\"collect\"></ul>\
            <div style=\"clear:both;\"></div>\
            </div>\
            <div class=\"row\"><span class=\"row globalbuy\">截止  | %@</span>\
            <div style=\"clear:both;\"></div>\
            </div>\
            </section>\
            \
            <section class=\"block\" style=\"border-top: 1px solid #d6d6d6;\">\
            \
            <div class=\"row-content prodetail\">\
            <p>%@</p>\
            <p><img src=\"%@\"></p>\
            </div>\
            \
            \
            </section>\
            \
            ",
            good.product_name,
            good.product_pure_provice,
            good.coupon_denomination,
            good.pure_provice,
            good.coupon_end.tk_AutoDiscriminatingTodayDate,
            good.introduce,
            good.product_main_image];
    
    ///拼接
    [html appendString:self.tk_localHTMLSimilarRecommend];
    
    //最后拼接
    [html appendString:@"\
    </body>\
    </html>\
    \
    "];
    
    return html;
}


- (NSString *)tk_localHTMLSimilarRecommend
{
    if (self.count == 0) {  return  @""; }
    
    //进行拼接
    NSMutableString *result = [NSMutableString string];
    
    //拼接开头
    [result appendString:@"\
     \
     <section class=\"block\">\
     <div class=\"row-title\">\
     <span>猜你喜欢</span>\
     </div>\
     </section>\
     <div class=\"row-content\">\
     <ol class=\"relateprolist\">\
     \
     "];
    
    //进行循环拼接
    [self enumerateObjectsUsingBlock:^(id <TKGood>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [result appendString:[NSString tk_localHTMLSimilarRecommend:obj]];
        
    }];
    
    //拼接结束
    [result appendString:@"\
     \
     </ol>\
     </div>\
     \
     "];
    
    return  result;
}

@end
