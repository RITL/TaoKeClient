//
//  TKBaseTableViewCell.m
//  XiaoNongDingClient
//
//  Created by RYDEN on 2017/4/26.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKBaseTableViewCell.h"
#import <objc/runtime.h>



@implementation TKBaseTableViewCell

- (instancetype)init
{
    if (self = [super init]) {
        
        self.cellHeight = 0.01;
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self buildView];
        [self addSubviews];
        [self buildLayouts];
    }
    
    return self;
}


- (void)prepareForReuse
{
    [super prepareForReuse];
}



- (void)buildView
{

}


- (void)addSubviews
{
    
}


- (void)buildLayouts
{
    
}


- (void)updateViewByData:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath  cellDelegate:(id)delegate
{

}



- (CGFloat)prepareHeightByDict:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath
{

    return 0.01;
}



-(void)dealloc
{
    objc_removeAssociatedObjects(self);
}


@end


@implementation TKBaseTableViewCell (BaseTableViewCellDelegate)



- (BOOL)hasDelegate
{
    return (self.delegate != nil);
}

- (BOOL)hasDidSelectCell
{
    return (self.hasDelegate && [self.delegate respondsToSelector:@selector(tk_baseTableViewCell:didSelectCellAtIndexPath:cellInfo:linkInfo:)]);
}


- (BOOL)hasDidSelectItem
{
    return (self.hasDelegate && [self.delegate respondsToSelector:@selector(tk_baseTableViewCell:didSelectItemAtIndex:indexPath:infoDict:)]);
}



-(void)actionDidSelectItemAtIndex:(NSInteger)index Info:(NSDictionary *)info
{
    
    if (self.hasDidSelectItem) {
        
        [self.delegate tk_baseTableViewCell:self didSelectItemAtIndex:index indexPath:self.indexPath infoDict:info];
    }
}


-(void)actionDidSelectCellAtIndex:(NSInteger)index Info:(NSDictionary *)info
{
    if (self.hasDidSelectCell) {
        
        [self.delegate tk_baseTableViewCell:self didSelectCellAtIndexPath:self.indexPath cellInfo:@{@"cell":self} linkInfo:info];
    }
}

@end
