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
            <script type=\"text/javascript\" src=\"iconfont.css\"></script>\
            <script type=\"text/javascript\" src=\"detailindex.css\"></script>\
            <script src=\"https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js\"></script>\
            <body class=\"notop\">\
            \
            \
            <section class=\"block info\">\
            <div class=\"litercoloum\"></div>\
            <h1 class=\"row\">%@</h1>\
            <span class=\"pricetext\" style=\"color:gray;\">原价<s>¥76</s></span>\
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
            <p>任何场合，轻松Hold住，优质毛绒内里，牛反绒砂面，呵护脚丫，全方位超强锁温！初冬选它，刚刚好！</p>\
            <p><img src=\"https://img.alicdn.com/bao/uploaded/i7/TB1yxGbNFXXXXXsaXXXWBTe8XXX_020708.jpg\"></p>\
            </div>\
            \
            \
            </section>\
            \
            <section class=\"block\">\
            <div class=\"row-title\">\
            <span>猜你喜欢</span>\
            </div>\
            <div class=\"row-content\">\
            <ol class=\"relateprolist\">\
            <li>\
            <a class=\"DisBlock\" style=\"text-decoration: none; \" href=\"app:good:2918654:5\"\
            title=\"包包女2017新款潮韩版百搭斜挎包小包风琴包女包秋冬季单肩小方包\">\
            <div class=\"relatepic\">\
            <img src=\"https://img.alicdn.com/imgextra/i3/765949453/TB1w0B5jwMPMeJjy1XdXXasrXXa_!!0-item_pic.jpg\">\
            </div>\
            <div class=\"relateinfo\">\
            <h3 class=\"\">包包女2017新款潮韩版百搭斜挎包小包风琴包女包秋冬季单肩小方包</h3>\
            <span class=\"promoinfo\" style=\"     padding: 2px 0;\
            color: #d22222;\
            line-height: 18px;\
            font-size: 13px;\
            white-space: nowrap;\
            text-overflow: ellipsis;\
            text-decoration: none;\
            overflow: hidden;\">30元券</span>\
            <div class=\"\">\
            <ul class=\"ref-row\" style=\"list-style: none;\
            margin: 0;\
            padding: 0;\
            vertical-align: baseline;\">\
            <li class=\"left\">截止10月30日 15:59</li>\
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
            <li>\
            <a class=\"DisBlock\" style=\"text-decoration: none; \" href=\"app:good:2858373:5\"\
            title=\"商务斜挎男包单肩包男牛津布休闲小包男士包包牛津布帆布防水背包\">\
            <div class=\"relatepic\">\
            <img src=\"https://img.alicdn.com/imgextra/i4/2737600227/TB2gF.FXv_HK1Jjy1zcXXXb7XXa_!!2737600227.jpg\">\
            </div>\
            <div class=\"relateinfo\">\
            <h3 class=\"\">商务斜挎男包单肩包男牛津布休闲小包男士包包牛津布帆布防水背包</h3>\
            <span class=\"promoinfo\" style=\"padding: 2px 0;\
            color: #d22222;\
            line-height: 18px;\
            font-size: 13px;\
            white-space: nowrap;\
            text-overflow: ellipsis;\
            text-decoration: none;\
            overflow: hidden;\">50元券</span>\
            <div class=\"\">\
            <ul class=\"ref-row\" style=\"list-style: none;\
            margin: 0;\
            padding: 0;\
            vertical-align: baseline;\">\
            <li class=\"left\">截止10月30日 15:59</li>\
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
            </ol>\
            </div>\
            </section>\
            </body>\
            </html>\
            \
            ",good.product_name,
            good.coupon_denomination,
            good.pure_provice,
            good.coupon_end];
    

}

@end
