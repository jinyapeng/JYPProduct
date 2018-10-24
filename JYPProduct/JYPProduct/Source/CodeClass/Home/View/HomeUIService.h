//
//  HomeUIService.h
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeUIService : NSObject

- (instancetype)initWithVC:(UIViewController *)VC;

@property (nonatomic,strong)UITableView *homeTableView;


@end
