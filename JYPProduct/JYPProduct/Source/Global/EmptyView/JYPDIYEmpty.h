//
//  JYPDIYEmpty.h
//  JYPProduct
//
//  Created by apple on 2018/5/31.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <LYEmptyView/LYEmptyView.h>

@interface JYPDIYEmpty : LYEmptyView

+ (instancetype)diyNoDataEmpty;

+ (instancetype)diyNoNetworkEmptyWithTarget:(id)target action:(SEL)action;

+ (instancetype)diyCustomEmptyViewWithTarget:(id)target action:(SEL)action;

@end
