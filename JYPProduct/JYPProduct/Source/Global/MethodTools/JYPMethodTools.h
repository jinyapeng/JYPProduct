//
//  JYPMethodTools.h
//  JYPProduct
//
//  Created by apple on 2018/5/31.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYPMethodTools : NSObject

+ (float)navigationBarHeight;

+ (float)tabBarHeight;

+ (void)headerRefreshWithTableView:(id )view completion:(void (^)(void))completion;

+ (void)gifHeaderRefreshWithTableView:(id )view completion:(void (^)(void))completion;

+ (void)footerRefreshWithTableView:(id )view completion:(void (^)(void))completion;

+ (void)diyNoNetworkEmptyWithTableView:(id )view Target:(id)target action:(SEL)action;




@end
