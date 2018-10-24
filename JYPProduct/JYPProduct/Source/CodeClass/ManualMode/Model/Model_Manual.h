//
//  Model_Manual.h
//  JYPProduct
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_Manual : NSObject

@property (nonatomic,assign)int month;
@property (nonatomic,assign)int day;

@property (nonatomic,assign)int count;

@property (nonatomic,  copy)NSString *star;
@property (nonatomic,  copy)NSString *end;


@end
