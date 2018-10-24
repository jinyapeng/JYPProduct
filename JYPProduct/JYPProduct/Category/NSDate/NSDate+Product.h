//
//  NSDate+Product.h
//  JYPProduct
//
//  Created by apple on 2018/7/10.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger ,DateForrmatterType) {
    
    DatePickerMode_YM,     // 年月
    DatePickerMode_YMD,    // 年月日
    DatePickerMode_YMDHM,  // 年月日 时分
    DatePickerMode_YMDHMS, // 年月日 时分秒
    DatePickerMode_HM,     // 时分
    DatePickerMode_HMS     // 时分秒
};

@interface NSDate (Product)

/**
 *获取当前时间的 毫秒值
 */
+ (NSString *)getTimeStamp;

/**
 * 根据日期格式，返回时间毫秒值
 */
+ (NSString *)getTimeStamp:(NSString *)TimeString Formatter:(NSString *)formatter;
+ (NSString *)getTimeStamp:(NSString *)TimeString FormatterType:(DateForrmatterType)formatterType;

/**
 * 获取格式化为
 */
+ (NSString *)format:(NSDate *)date Formatter:(NSString *)formatter;

/**
 *获取当前时间的 日期格式
 */
+ (NSString *)getCurrentTimeWithForrmatter:(NSString *)forrmatter;
+ (NSString *)getCurrentTimeWithForrmatterType:(DateForrmatterType)forrmatterType;

/**
 *根据毫秒值 获取forrmatter 对应的 日期格式
 */
+ (NSString *)getDateForrmatter:(NSString *)timeStamp Forrmatter:(NSString *)forrmatter;
+ (NSString *)getDateForrmatter:(NSString *)timeStamp ForrmatterType:(DateForrmatterType)forrmatterType;

/**
 * 根据时间毫秒值 返回 NSDate
 */
+ (NSDate *)getDateWithTimeStamp:(NSString *)timeStamp;

/**
 * 根据日期格式 返回 NSDate
 */
+ (NSDate *)getDate:(NSString *)TimeString Formatter:(NSString *)formatter;
+ (NSDate *)getDate:(NSString *)TimeString FormatterType:(DateForrmatterType)formatterType;


/**
 * 返回numYears年后的日期
 */
+ (NSString *)offsetYears:(int)numYears fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;

/**
 * 返回numMonths月后的日期
 */
+ (NSString *)offsetMonths:(int)numMonths fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;

/**
 * 返回numDays天后的日期
 */
+ (NSString *)offsetDays:(int)numDays fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;

/**
 * 返回numHours时后的日期
 */
+ (NSString *)offsetHours:(int)numHours fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;

/**
 * 返回numMinutes分后的日期
 */
+ (NSString *)offsetMinutes:(int)numMinutes fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;


/**
 * 返回numYears年后的日期
 * 返回numMonths月后的日期
 * 返回numDays天后的日期
 */
+ (NSString *)offsetYears:(int)numYears
                   Months:(int)numMonths
                     Days:(int)numDays
                 fromDate:(NSString *)fromDate Formatter:(NSString *)formatter;


/**
 * 判断时间早晚
 */
+(int)compareStarTime:(NSString *)starTime endTime:(NSString *)endTime Formatter:(NSString *)formatter;












@end
