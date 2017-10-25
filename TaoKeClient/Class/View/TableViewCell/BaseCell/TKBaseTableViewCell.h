//
//  TKBaseTableViewCell.h
//  XiaoNongDingClient
//
//  Created by ryden on 2017/4/26.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>


NS_ASSUME_NONNULL_BEGIN


@class TKBaseTableViewCell;

@protocol TKBaseTableViewCellDelegate <NSObject>

@optional


/**
 点击Cell的某一项，比如一个Cell包含6个商品的情况

 @param cell 执行回调的cell
 @param index 点击的Item位于Cell的索引
 @param indexPath UITableViewCell的IndexPath
 @param infoDict 附属信息（可能为空）
 */
- (void)tk_baseTableViewCell:(TKBaseTableViewCell *)cell
     didSelectItemAtIndex:(NSInteger)index
                   indexPath:(NSIndexPath * _Nullable)indexPath
                    infoDict:(NSDictionary * _Nullable)infoDict;

/**
 点击整个Cell

 @param cell 执行回调的cell
 @param indexPath UITableViewCell的IndexPath
 @param cellInfo 当前整个cell信息
 @param linkInfo 跳转Link信息
 */
- (void)tk_baseTableViewCell:(TKBaseTableViewCell *)cell
 didSelectCellAtIndexPath:(NSIndexPath *)indexPath
                 cellInfo:(NSDictionary * _Nullable)cellInfo
                 linkInfo:(NSDictionary * _Nullable)linkInfo;

@end




@interface TKBaseTableViewCell : UITableViewCell

/// 代理对象
@property (nonatomic, weak, nullable) id<TKBaseTableViewCellDelegate>delegate;
/// 存储的信息
@property (nonatomic, copy, nullable) NSDictionary *messageInfo;
/// 当前cell的indexPath
@property (nonatomic, strong, nullable) NSIndexPath *indexPath;
/// cell的高度,默认0.0
@property (nonatomic, assign)CGFloat cellHeight;


/*  视图创建 */
- (void)buildView;
- (void)addSubviews;
- (void)buildLayouts;


/**
 Cell数据填充

 @param dataDict 数据字典
 @param indexPath cell的indexpath
 @param delegate 通过delegate定位VC
 */
- (void)updateViewByData:(nullable NSDictionary *)dataDict
               indexPath:(NSIndexPath *)indexPath
            cellDelegate:(id)delegate;



/**
 *  用于动态计算高度
 *
 *  @param dataDict  当前Page的PageItems
 *  @param indexPath UITableViewCell的IndexPath
 */
- (CGFloat)prepareHeightByDict:(nullable NSDictionary *)dataDict
                  indexPath:(NSIndexPath *)indexPath;


@end






@interface TKBaseTableViewCell (TKAnimated)

/// 开启动画并在完成后的回调
- (void)actionAnimatedCompleteHandler:(nullable void(^)(void))animatedCompleteHandler;

@end




@interface TKBaseTableViewCell (BaseTableViewCellDelegate)

/// 是否实现didSelectItemAtIndex:协议方法
@property(nonatomic, assign, readonly, getter=hasDidSelectItem)BOOL didSelectItem;

/// 是否实现didSelectCellAtIndexPath:协议方法
@property(nonatomic, assign, readonly, getter=hasDidSelectCell)BOOL didSelectCell;




/**
 快速执行didSelectItemAtIndex:的协议方法

 @param index 点击的Item位于Cell的索引
 @param info  附带的信息
 */
- (void)actionDidSelectItemAtIndex:(NSInteger)index Info:(NSDictionary *)info;



/**
 快速执行didSelectCellAtIndexPath:的协议方法

 @param index 点击Item位于Cell的索引
 @param info 附带的信息
 */
- (void)actionDidSelectCellAtIndex:(NSInteger)index Info:(NSDictionary *)info;

@end



NS_ASSUME_NONNULL_END
