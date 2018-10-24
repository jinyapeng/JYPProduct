//
//  NSDate+Mac.h
//  JYPProduct
//
//  Created by apple on 2018/7/10.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Mac)

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)day;
- (NSUInteger)month;
- (NSUInteger)year;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;
+ (NSUInteger)day:(NSDate *)date;
+ (NSUInteger)month:(NSDate *)date;
+ (NSUInteger)year:(NSDate *)date;
+ (NSUInteger)hour:(NSDate *)date;
+ (NSUInteger)minute:(NSDate *)date;
+ (NSUInteger)second:(NSDate *)date;


@end
