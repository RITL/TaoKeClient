//
//  NSArray+TKExtension.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/6/22.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "NSArray+TKExtension.h"

@implementation NSArray (TKExtension)


-(NSArray *)tk_map:(id  _Nonnull (^)(id _Nonnull))mapHander
{
    return [self tk_reduce:@[] reduceHandler:^NSArray * _Nonnull(NSArray * _Nonnull result, id _Nonnull element) {
        
        return [result arrayByAddingObject:mapHander(element)];
    }];
}




- (NSArray *)tk_detailMap:(id(^)(id,NSInteger))mapHandler
{
    return [self tk_detailReduce:@[] reduceHandler:^NSArray * _Nonnull(NSArray * _Nonnull result, id _Nonnull element, NSInteger index) {
        
        return [result arrayByAddingObject:mapHandler(element,index)];
    }];
}


-(NSArray *)tk_filter:(BOOL (^)(id _Nonnull))filterHandler
{
    return [self tk_reduce:@[] reduceHandler:^NSArray * _Nonnull(NSArray * _Nonnull result, id _Nonnull element) {
        
        return filterHandler(element) ? [result arrayByAddingObject:element] : result;
    }];
}


- (NSArray *)tk_detailFilter:(BOOL (^)(id _Nonnull, NSInteger))filterHandler
{
    return [self tk_detailReduce:@[] reduceHandler:^NSArray * _Nonnull(NSArray * _Nonnull result, id _Nonnull element, NSInteger index) {
        
        return filterHandler(element,index) ? [result arrayByAddingObject:element] : result;
    }];
}



-(NSArray *)tk_reduce:(NSArray *)initial
         reduceHandler:(NSArray* _Nonnull (^)(NSArray *_Nonnull, id _Nonnull))reduceHandler
{
    NSArray *result = initial;
    
    for (id object in self) {
        
        result = reduceHandler(result,object);
    }
    
    return result;
}



- (NSArray *)tk_detailReduce:(NSArray *)initial reduceHandler:(NSArray * _Nonnull (^)(NSArray * _Nonnull, id _Nonnull, NSInteger))reduceHandler
{
    __block NSArray *result = initial;
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        result = reduceHandler(result,obj,idx);
    }];
    
    return result;
}


- (id)tk_safeFirstObject
{
    return [self tk_safeObjectAtIndex:0];
}


-(id)tk_safeObjectAtIndex:(NSInteger)index
{
    if (index >= self.count || index < 0) {
        
        return nil;
    }
    
    return [self objectAtIndex:index];
}


-(id)tk_revertObjectAtIndex:(NSInteger)index
{
    if (index < 0 || index >= self.count) {
        
        return nil;
    }
    
    return [self objectAtIndex:(self.count - index - 1)];
}


- (NSArray *)tk_revert
{
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:self.count];
    
    for(NSInteger i = self.count - 1; i >= 0; i--) {
        
        [array addObject:self[i]];
    }

    return array.mutableCopy;
}

@end




