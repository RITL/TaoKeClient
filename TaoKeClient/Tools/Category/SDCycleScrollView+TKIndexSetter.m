//
//  SDCycleScrollView+TKIndexSetter.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/9.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "SDCycleScrollView+TKIndexSetter.h"
#import "TKRuntimeTool.h"
#import <SDCollectionViewCell.h>

@implementation SDCycleScrollView (TKIndexSetter)


-(BOOL)scrollToIndex:(NSInteger)currentIndex
{
    return [self scrollToIndex:currentIndex animated:false];
}


-(BOOL)scrollToIndex:(NSInteger)currentIndex animated:(BOOL)animated
{
    //构建indexPath
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:currentIndex inSection:0];
    
    //获得滚动视图
    UICollectionView * mainView = [self valueForKey:@"mainView"];
    
    if (!mainView) return false;
    
    UICollectionViewScrollPosition scrollViewPosition = UICollectionViewScrollPositionTop;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        
        scrollViewPosition = UICollectionViewScrollPositionRight;
    }
    
    [mainView scrollToItemAtIndexPath:indexPath atScrollPosition:scrollViewPosition animated:animated];
    
    return true;
}

@end



@implementation SDCycleScrollView (TKExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        TK_swizzledInstanceSelector(self.class, sel_registerName("initialization"), sel_registerName("tk_initialization"));

        TK_swizzledInstanceSelector(self.class, sel_registerName("collectionView:cellForItemAtIndexPath:"), sel_registerName("tk_collectionView:cellForItemAtIndexPath:"));
    });

}


- (void)tk_initialization
{
    [self tk_initialization];
    self.backgroundColor = [UIColor whiteColor];
}

- (UICollectionViewCell *)tk_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self tk_collectionView:collectionView cellForItemAtIndexPath:indexPath];

    if ([cell isKindOfClass:SDCollectionViewCell.class]) {

        SDCollectionViewCell *collectionCell = (SDCollectionViewCell *)cell;

        //修改
        collectionCell.imageView.backgroundColor = [UIColor whiteColor];
    }

    return cell;
}



@end
