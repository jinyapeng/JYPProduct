//
//  JYPMethodTools.m
//  JYPProduct
//
//  Created by apple on 2018/5/31.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "JYPMethodTools.h"

@implementation JYPMethodTools

+ (float)navigationBarHeight
{
    if (kiPhoneXAll) {
        return 88.f;
    }
    return 64.f;
}

+ (float)tabBarHeight
{
    if (kiPhoneXAll) {
        return 83.f;
    }
    return 49.f;
}


+ (void)headerRefreshWithTableView:(id )view completion:(void (^)(void))completion{
    
    MJRefreshNormalHeader *headerR = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        completion();
    }];
    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableview = (UITableView *)view;
        tableview.mj_header = headerR;
    } else if ([view isKindOfClass:[UICollectionView class]]){
        UICollectionView *tableview = (UICollectionView *)view;
        tableview.mj_header = headerR;
    }
}

+ (void)gifHeaderRefreshWithTableView:(id )view completion:(void (^)(void))completion
{
    MJRefreshGifHeader *headerView = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        completion();
    }];
    
    // 隐藏时间
    headerView.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    headerView.stateLabel.hidden = YES;
    
    NSString *title = @"让采购更便捷";;
    NSString *stateString1 = [NSString stringWithFormat:@"%@下拉更新...",title];
    NSString *stateString2 = [NSString stringWithFormat:@"%@松开更新...",title];
    NSString *stateString3 = [NSString stringWithFormat:@"%@更新中...",title];
    [headerView setTitle:stateString1 forState:MJRefreshStateIdle];
    [headerView setTitle:stateString2 forState:MJRefreshStatePulling];
    [headerView setTitle:stateString3 forState:MJRefreshStateRefreshing];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int i = 1; i <= 9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"YCRefreshTableHeader%d", i]];
        if (image != nil) {
            [refreshingImages addObject:image];
        }
    }
    [headerView setImages:refreshingImages forState:MJRefreshStateIdle];
    
    [headerView setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [headerView setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableview = (UITableView *)view;
        tableview.mj_header = headerView;
    } else if ([view isKindOfClass:[UICollectionView class]]){
        UICollectionView *tableview = (UICollectionView *)view;
        tableview.mj_header = headerView;
    }
}


+ (void)footerRefreshWithTableView:(id )view completion:(void (^)(void))completion{
    
    MJRefreshBackStateFooter *footerR = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        completion();
    }];
    if ([view isKindOfClass:[UITableView class]]) {
        UITableView *tableview = (UITableView *)view;
        tableview.mj_footer = footerR;
    } else if ([view isKindOfClass:[UICollectionView class]]){
        UICollectionView *tableview = (UICollectionView *)view;
        tableview.mj_footer = footerR;
    }
}

+ (void)diyNoNetworkEmptyWithTableView:(id )view Target:(id)target action:(SEL)action
{
    UITableView *tableview = (UITableView *)view;
    tableview.ly_emptyView = [JYPDIYEmpty diyNoNetworkEmptyWithTarget:target action:action];
}

@end
