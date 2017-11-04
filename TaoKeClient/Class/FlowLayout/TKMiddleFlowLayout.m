//
//  XNDFarmRecommendFlowLayout.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/18.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKMiddleFlowLayout.h"


@interface TKMiddleFlowLayout()

@property (nonatomic, assign) NSInteger numberOfItems;
@property (nonatomic, assign) CGSize realSize;
@property (nonatomic, assign) CGFloat minScale;
@property (nonatomic, assign) CGFloat maxScale;

/// 用于记录所有items的centerX
@property (nonatomic, copy)NSArray <NSNumber *> *itemsCenterX;

@end

@implementation TKMiddleFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self buildData];
}



- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return true;
}


- (CGSize)collectionViewContentSize
{
    //获得高度
    CGFloat height = self.collectionView.frame.size.height;
    
    CGFloat width = (self.maxItemSize.width + self.itemMargin) * self.numberOfItems + self.itemMargin + 2 * self.itemMarginSpace;
    
    return CGSizeMake(width, height);
}




- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * attributes = [NSMutableArray arrayWithCapacity:self.numberOfItems];
    
    for (NSInteger i = 0; i < self.numberOfItems; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        //获得attributes
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes.copy;
}




- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获得可视区域
//    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x,
//                                    self.collectionView.contentOffset.y,
//                                    self.collectionView.frame.size.width,
//                                    self.collectionView.frame.size.height);

//    CGFloat visibleMiddle = CGRectGetMidX(visibleRect);
    
    //获得当前的个数
    NSInteger item = indexPath.item;
    
    //设置位置属性
    CGFloat centerX = [self defaultCenterXWithItem:item];
    CGFloat centerY = self.collectionView.bounds.size.height / 2.0;
    
    attribute.center = CGPointMake(centerX, centerY);
    attribute.size = self.maxItemSize;
    
    //获得当前的centerX
//    CGFloat currentCenterX = [self defaultCenterXWithItem:item];
    
    //计算距离
//    CGFloat centerDistance = fabs(visibleMiddle - currentCenterX);
    
    //总距离
//    CGFloat totalDistance = self.maxItemSize.width / 2.0 + self.itemMargin + self.itemMarginSpace;

//    if (centerDistance >= totalDistance && !CATransform3DEqualToTransform(attribute.transform3D,CATransform3DIdentity)) {//如果在屏幕外
//
//        attribute.transform = CGAffineTransformIdentity;
//        attribute.size = self.maxItemSize;
//    }
//
//    else {//进入屏幕内，进行变大缩放
//
//        CGFloat centerDistanceScale = centerDistance / totalDistance;
//
//        //相应的宽度比例
//        CGFloat widthScale = self.maxItemSize.width / self.minItemSize.width - 1;
//        CGFloat heightScale = self.maxItemSize.height / self.minItemSize.height - 1;
//
////        attribute.transform = CGAffineTransformMakeScale(widthScale * (1 - centerDistanceScale) + 1,  heightScale *(1 - centerDistanceScale) + 1);
//    }

    return attribute;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //获得可视区域
    CGRect visibleRect = CGRectMake(proposedContentOffset.x,
                                    proposedContentOffset.y,
                                    self.collectionView.frame.size.width,
                                    self.collectionView.frame.size.height);
    
    CGFloat visibleMiddle = CGRectGetMidX(visibleRect);
    
    //逆向获得item
    //(item + 0.5) * self.maxItemSize.width + (item + 1) * self.itemMargin + self.itemMarginSpace = visibleMiddle (item = x)
    // (x + 0.5)A + (x + 1)B + C = F
    // x = (F - C - 0.5A - B) / (A + B)
    CGFloat estimateIndex = (visibleMiddle - self.itemMarginSpace - 0.5 * self.maxItemSize.width - self.itemMargin) / (self.maxItemSize.width + self.itemMargin);
    
    NSInteger index = round(estimateIndex);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(farmRecommendMiddleFlowLayout:scrollToIndex:total:)]) {
        
        [self.delegate farmRecommendMiddleFlowLayout:self scrollToIndex:index total:self.numberOfItems];
        
    }
    
    //获得中点位置
    CGFloat indexCenter = self.itemsCenterX[index].floatValue;
    
    //获得真正的偏移量
    CGFloat x = indexCenter - self.maxItemSize.width / 2.0 - self.itemMargin - self.itemMarginSpace;
    
    proposedContentOffset.x = x;
    
    return proposedContentOffset;
}





#pragma mark - function


- (void)buildData
{
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    //获得默认大小
    CGFloat defaultWidth = (self.maxItemSize.width + self.minItemSize.width) / 2.0;
    CGFloat defaultHeight = (self.maxItemSize.height + self.minItemSize.height) / 2.0;
    self.realSize = CGSizeMake(defaultWidth, defaultHeight);
    
    //比例
    self.maxScale = self.maxItemSize.width / self.realSize.width;
    self.minScale = self.minItemSize.width / self.realSize.width;

    [self calculateCenterXs];
}


/// 计算所有的中心位置
- (void)calculateCenterXs
{
    //进行中心计算
    NSMutableArray<NSNumber *> *centerXs = [NSMutableArray arrayWithCapacity:self.numberOfItems];
    
    for (int item = 0; item < self.numberOfItems; item++) {
        
        [centerXs addObject:@((item + 0.5) * self.maxItemSize.width + (item + 1) * self.itemMargin + TKScale(10))];

    }
    
    self.itemsCenterX = centerXs.mutableCopy;
}




- (CGFloat)defaultCenterXWithItem:(NSInteger)item
{
    return self.itemsCenterX[item].floatValue;
}


@end
