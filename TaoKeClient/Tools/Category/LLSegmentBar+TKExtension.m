//
//  LLSegmentBar+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "LLSegmentBar+TKExtension.h"
#import <objc/runtime.h>

@implementation LLSegmentBar (TKExtension)


- (NSArray<id<TKCategoryTitle>> *)titleItems
{
    return objc_getAssociatedObject(self, _cmd);
}



- (void)setTitleItems:(NSArray<id<TKCategoryTitle>> *)titleItems
{
    if (titleItems) {
        
        objc_setAssociatedObject(self, @selector(titleItems), titleItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        //进行赋值
        self.items = [titleItems tk_map:^id _Nonnull(id<TKCategoryTitle> _Nonnull item) {
            
            return item.cname;
        }];
    }
}


- (UIView *)tk_map_indicatorView
{
    return [self valueForKey:@"indicatorView"];
}

@end
