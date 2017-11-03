//
//  NSDictionary+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/11/2.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "NSDictionary+TKExtension.h"

@implementation NSDictionary (TKExtension)

@end


@implementation NSDictionary (TKTransToJson)

- (NSString *)tk_json
{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        
        return nil;
    }
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {  return nil; }
    
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSString *)tk_javascript_json
{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        
        return nil;
    }
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    
    if (error) {  return nil; }
    
    NSString *infoString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return infoString;
}


@end
