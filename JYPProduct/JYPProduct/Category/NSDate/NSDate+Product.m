//
//  NSDate+Product.m
//  JYPProduct
//
//  Created by apple on 2018/7/10.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "NSDate+Product.h"

@implementation NSDate (Product)


/**
 *获取当前时间的 毫秒值
 */
+ (NSString *)getTimeStamp
{
    NSDate *date     = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%.0f", time];
    
    return timeStamp;
}

/**
 * 根据日期格式，返回时间毫秒值
 */
+ (NSString *)getTimeStamp:(NSString *)TimeString Formatter:(NSString *)formatter
{
    // 实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date     = [dateFormatter dateFromString:TimeString];
    
    NSTimeInterval time = [date timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%.0f", time];
    
    return timeStamp;
}

+ (NSString *)getTimeStamp:(NSString *)TimeString FormatterType:(DateForrmatterType)formatterType
{
    NSString *forrmatterStr = [NSDate  getgetDateForrmatter:formatterType];
    NSString *timeStamp     = [NSDate getTimeStamp:TimeString Formatter:forrmatterStr];
    
    return timeStamp;
}

+ (NSString *)format:(NSDate *)date Formatter:(NSString *)formatter
{
    // 实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *currentTime = [dateFormatter stringFromDate:date];
    
    return currentTime;
}

/**
 *获取当前时间的 日期格式
 */
+ (NSString *)getCurrentTimeWithForrmatter:(NSString *)formatter
{
    NSString *currentTime = [NSDate getDateForrmatter:[NSDate getTimeStamp] Forrmatter:formatter];
    return currentTime;
}

+ (NSString *)getCurrentTimeWithForrmatterType:(DateForrmatterType)formatterType
{
    NSString *currentTime = [NSDate getDateForrmatter:[NSDate getTimeStamp] ForrmatterType:formatterType];
    return currentTime;
}

/**
 *根据毫秒值 获取forrmatter 对应的 日期格式
 */

+ (NSString *)getDateForrmatter:(NSString *)timeStamp ForrmatterType:(DateForrmatterType)formatterType
{
    NSString *forrmatterStr = [NSDate  getgetDateForrmatter:formatterType];
    NSString *currentTime   = [NSDate getDateForrmatter:[NSDate getTimeStamp] Forrmatter:forrmatterStr];
    return currentTime;
}

+ (NSString *)getDateForrmatter:(NSString *)timeStamp Forrmatter:(NSString *)formatter
{
    NSTimeInterval time = [timeStamp doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    // 实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *currentTime = [dateFormatter stringFromDate:date];
    
    return currentTime;
}

+ (NSString *)getgetDateForrmatter:(DateForrmatterType)forrmatterType
{
    NSString *forrmatterStr = [NSString string];
    switch (forrmatterType) {
        case DatePickerMode_YM:
        {
            forrmatterStr = @"yyyy-MM";
        }
            break;
        case DatePickerMode_YMD:
        {
            forrmatterStr = @"yyyy-MM-dd";
        }
            break;
        case DatePickerMode_YMDHM:
        {
            forrmatterStr = @"yyyy-MM-dd HH:mm";
        }
            break;
        case DatePickerMode_YMDHMS:
        {
            forrmatterStr = @"yyyy-MM HH:mm:ss";
        }
            break;
        case DatePickerMode_HM:
        {
            forrmatterStr = @"HH:mm";
        }
            break;
        case DatePickerMode_HMS:
        {
            forrmatterStr = @"HH:mm:ss";
        }
            break;
        default:
            break;
    }
    return forrmatterStr;
}


/**
 * 根据时间毫秒值 返回 NSDate
 */
+ (NSDate *)getDateWithTimeStamp:(NSString *)timeStamp
{
    NSTimeInterval time = [timeStamp doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}

/**
 * 根据日期格式 返回 NSDate
 */
+ (NSDate *)getDate:(NSString *)TimeString Formatter:(NSString *)formatter
{
    // 实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date     = [dateFormatter dateFromString:TimeString];
    
    return date;
}

+ (NSDate *)getDate:(NSString *)TimeString FormatterType:(DateForrmatterType)formatterType
{
    NSString *forrmatterStr = [NSDate  getgetDateForrmatter:formatterType];
    NSDate *date     = [NSDate getDate:TimeString Formatter:forrmatterStr];
    
    return date;
}


/**
 * 返回numYears年后的日期
 */
+ (NSString *)offsetYears:(int)numYears fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    return [NSDate offsetYears:numYears
                        Months:0
                          Days:0
                      fromDate:fromDate Formatter:formatter];
}


/**
 * 返回numMonths月后的日期
 */
+ (NSString *)offsetMonths:(int)numMonths fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    return [NSDate offsetYears:0
                        Months:numMonths
                          Days:0
                      fromDate:fromDate Formatter:formatter];
}

/**
 * 返回numDays天后的日期
 */
+ (NSString *)offsetDays:(int)numDays fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    return [NSDate offsetYears:0
                        Months:0
                          Days:numDays
                      fromDate:fromDate Formatter:formatter];
}

/**
 * 返回numHours时后的日期
 */
+ (NSString *)offsetHours:(int)numHours fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    if (fromDate == nil) {
        return nil;
    }
    
    NSDate *starDate = [NSDate getDate:fromDate Formatter:formatter];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    NSDate *endDate = [gregorian dateByAddingComponents:offsetComponents toDate:starDate options:0];
    
    return [NSDate format:endDate Formatter:formatter];
}

/**
 * 返回numMinutes分后的日期
 */
+ (NSString *)offsetMinutes:(int)numMinutes fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    if (fromDate == nil) {
        return nil;
    }
    
    NSDate *starDate = [NSDate getDate:fromDate Formatter:formatter];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMinute:numMinutes];
    
    NSDate *endDate = [gregorian dateByAddingComponents:offsetComponents toDate:starDate options:0];
    
    return [NSDate format:endDate Formatter:formatter];
}

/**
 * 返回numYears年后的日期
 * 返回numMonths月后的日期
 * 返回numDays天后的日期
 */
+ (NSString *)offsetYears:(int)numYears
                   Months:(int)numMonths
                     Days:(int)numDays
                 fromDate:(NSString *)fromDate Formatter:(NSString *)formatter
{
    if (fromDate == nil) {
        return nil;
    }
    
    NSDate *starDate = [NSDate getDate:fromDate Formatter:formatter];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    [offsetComponents setMonth:numMonths];
    [offsetComponents setDay:numDays];
    
    NSDate *endDate = [gregorian dateByAddingComponents:offsetComponents toDate:starDate options:0];
    
    return [NSDate format:endDate Formatter:formatter];
}

+(int)compareStarTime:(NSString *)starTime endTime:(NSString *)endTime Formatter:(NSString *)formatter
{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    
    NSDate *starDate = [dateFormatter dateFromString:starTime];
    NSDate *endDate  = [dateFormatter dateFromString:endTime];
    
    NSComparisonResult result = [starDate compare:endDate];
    if (result == NSOrderedDescending) {
        // starTime 晚于 endTime
        return 1;
    }else if (result == NSOrderedAscending){
        // endTime 晚于 starTime
        return -1;
    }
    // 相等
    return 0;
    
}





@end
