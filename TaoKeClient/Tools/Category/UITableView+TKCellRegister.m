//
//  UITableView+TKCellRegister.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/9.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "UITableView+TKCellRegister.h"

@implementation UITableView (TKCellRegister)


/// 注册cell
- (void)registeCellWithIdentidiers:(NSSet *)identifiers
{
    for (NSString * identifier in identifiers) {
        

        [self registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
    }
}



- (void)tk_registerClasses:(NSArray<Class> *)cellClasses forCellReuseIdentifiers:(NSArray<NSString *> *)identifiers
{
    if (cellClasses.count != identifiers.count) {
        
        return;
    }
    
    for (NSInteger i = 0; i < cellClasses.count; i++) {
        
        [self registerClass:cellClasses[i] forCellReuseIdentifier:identifiers[i]];
        
    }
}

@end


@implementation UITableView (TKDequeueCell)

- (UITableViewCell *)tk_dequeueReusableCellWithIdentifier:(NSString *)identifier class:(Class)cellClass
{
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell =  [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
