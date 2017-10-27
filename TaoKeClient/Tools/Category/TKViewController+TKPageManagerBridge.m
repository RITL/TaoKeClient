//
//  TKViewController+TKPageManagerBridge.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/26.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController+TKPageManagerBridge.h"
#import "TKPageManager.h"

@implementation TKViewController (TKPageManagerBridge)


- (void)sendMessageToPageManager:(NSDictionary *)info
{
    [TKPageManager pageManagerFromObject:self info:info];
}


#pragma mark - TKBaseTableViewCellDelegate

- (void)tk_baseTableViewCell:(TKBaseTableViewCell *)cell
        didSelectItemAtIndex:(NSInteger)index
                   indexPath:(NSIndexPath * _Nullable)indexPath
                    infoDict:(NSDictionary * _Nullable)infoDict
{
    [TKPageManager pageManagerFromObject:cell info:infoDict];
}


- (void)tk_baseTableViewCell:(TKBaseTableViewCell *)cell
    didSelectCellAtIndexPath:(NSIndexPath *)indexPath
                    cellInfo:(NSDictionary * _Nullable)cellInfo
                    linkInfo:(NSDictionary * _Nullable)linkInfo
{
    [TKPageManager pageManagerFromObject:cell info:linkInfo];
}


#pragma mark - TKAllCategoryHeaderDelegate

- (void)tk_allCategoryHeaderView:(TKAllCategoryHeaderView *)headerView
                            type:(TKAllCategoryHeaderViewActionType)type
                            info:(NSDictionary *)info
{
     [TKPageManager pageManagerFromObject:headerView info:info];
}

@end
