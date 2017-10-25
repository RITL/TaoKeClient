//
//  UITableView+TKCellRegister.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/9.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (TKCellRegister)

/**
 根据标志位进行注册cell

 @param identifiers 存放标志位的集合
 */
- (void)registeCellWithIdentidiers:(NSSet *)identifiers;



/**
 批量注册cell
 
 @param cellClasses 注册cell的Class数组
 @param identifiers 注册cell的identifiers数组
 */
- (void)tk_registerClasses:(NSArray<Class>*)cellClasses
   forCellReuseIdentifiers:(NSArray<NSString *>*)identifiers;



@end


@interface UITableView (TKDequeueCell)


- (__kindof UITableViewCell *)tk_dequeueReusableCellWithIdentifier:(NSString *)identifier class:(Class)cellClass;

@end


NS_ASSUME_NONNULL_END
