//
//  NSString+TKImageAttributeString.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/15.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "NSString+TKExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TKImageAttributeString)


-(NSAttributedString *)tk_imageAttributeStringWithImage:(UIImage *)image attributes:(NSDictionary *)attributes baselineOffValue:(NSNumber *)value
{
    NSMutableAttributedString *attibuteResult = [[NSMutableAttributedString alloc]initWithString:@""];
    
    //自身文字
    NSString * handleString = [NSString stringWithFormat:@"%@ ",self];
    
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:handleString attributes:attributes];
    
    
    //放置图片
    NSTextAttachment * textAttachement = [NSTextAttachment new];
    textAttachement.image = image;
    NSAttributedString * imageAttributeString = [NSAttributedString attributedStringWithAttachment:textAttachement];
    NSMutableAttributedString *imageHandler = [[NSMutableAttributedString alloc]initWithAttributedString:imageAttributeString];
    [imageHandler addAttribute:NSUnderlineColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, imageHandler.length)];
    
//    //替换
//    [attributeString replaceCharactersInRange:[handleString rangeOfString:@"Y"] withAttributedString:imageAttributeString];
//
//    [attributeString addAttribute:NSBaselineOffsetAttributeName value:value range:[handleString rangeOfString:@"Y"]];
//
//    [attributeString addAttribute:NSUnderlineColorAttributeName value:[UIColor clearColor] range:NSMakeRange(0, attributeString.length)];
    
    //拼接
    [attibuteResult appendAttributedString:attributeString];
    [attibuteResult appendAttributedString:imageHandler];
    
    return [attibuteResult mutableCopy];
}

@end



@implementation NSString (TKMD5)

-(NSString *)tk_md5ForLower32Bate
{
    const char *input = self.UTF8String;//转成C字符串
    unsigned char result[CC_MD5_DIGEST_LENGTH];//存放结果
    
    CC_MD5(input, (CC_LONG)strlen(input), result);//进行加密
    
    // 拼接成字符串
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        
        [digest appendFormat:@"%02x",result[i]];
    }
    
    return digest;
}

@end


@implementation NSString (TKURL)

-(NSURL *)tk_url
{
    return [NSURL URLWithString:self];
}

@end


@implementation NSString (TKPhone)

-(NSString *)tk_phone
{
    if (self.length < 3) {
        
        return @"";
    }
    
    //获得所有的长度
    NSInteger length = self.length;
    
    //获得*的个数
    NSInteger numberhide = length - 7  < 0 ? 0 : length - 7;
    
    //进行替换
    NSString *numberhideString = @"";
    
    
    for (NSInteger i = 0; i < numberhide; i ++) {
        
        numberhideString = [numberhideString stringByAppendingString:@"*"];
    }
    
    //进行替换
    NSString *numberResult = [self stringByReplacingCharactersInRange:NSMakeRange(3, numberhide) withString:numberhideString];
    
    return numberResult;
}

@end


@implementation NSString (TKAttributeString)

-(NSAttributedString *)tk_underLineString
{
    //初始化
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:self attributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    return string.mutableCopy;
}

@end



@implementation NSString (TKDate)

- (NSString *)tk_dayDate
{
    if (self.integerValue == 0) {
        
        return self;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.integerValue];

    NSDateFormatter *formatter = [NSDateFormatter tk_object:^(__kindof NSDateFormatter *  _Nonnull object) {
        
        object.dateFormat = @"yyyy-MM-dd";
    }];
    
    
    //设置转换
    return [formatter stringFromDate:date];
}

@end


@implementation NSString (TKRandom)

+ (NSString *)tk_randowString
{
    NSString *string = [[NSString alloc]init];
    
    for (int i = 0; i < 32; i++) {
        
        int number = arc4random() % 36;
        
        if (number < 10)
        {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }
        
        else
        {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    
    return string;
}

@end
