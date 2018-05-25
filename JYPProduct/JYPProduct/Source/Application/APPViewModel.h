//
//  APPViewModel.h
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPViewModel : NSObject


+ (instancetype)shareApp;

- (void)finishLaunchOption:(NSDictionary *)option;

@end
