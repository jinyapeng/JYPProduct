//
//  CBUIKit.h
//  JinXuanGongYu
//
//  Created by xinkai on 2017/12/7.
//  Copyright © 2017年 JYP. All rights reserved.
//  快速创建常用控件

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBUIKit : NSObject

#pragma mark - For UILabel

+ (UILabel *)createLabelWithTextColor:(UIColor *)textColor
                             fontSize:(CGFloat)fontSize;

+ (UILabel *)createLabelWithTextColor:(UIColor *)textColor
                             fontSize:(CGFloat)fontSize text:(NSString *)text;

#pragma mark - For UIView

+ (UIView *)createViewWithBgColor:(UIColor *)bgColor;

+ (UIView *)createViewWithBgColor:(UIColor *)bgColor
                     cornerRadius:(CGFloat)cornerRadius;

#pragma mark - For UIButton

+ (UIButton *)createButtonWithTitle:(NSString *)title
                           fontSize:(CGFloat)fontSize
                         titleColor:(UIColor *)titleColor;

+ (UIButton *)createButtonWithTitle:(NSString *)title
                           fontSize:(CGFloat)fontSize
                         titleColor:(UIColor *)titleColor
                       cornerRadius:(CGFloat)cornerRadius;

#pragma mark - For UIImageView

+ (UIImageView *)createImageViewWithImage:(UIImage *)image;

+ (UIImageView *)createImageViewWithCornerRadius:(CGFloat)cornerRadius;

#pragma mark - For UITableView

+ (UITableView *)createTableViewWithStyle:(UITableViewStyle)style
                           separatorStyle:(CGFloat)separatorStyle;

#pragma mark - For UITextField

+ (UITextField *)createTextFieldWithPlaceholder:(NSString *)placeholder
                                      textColor:(UIColor *)textColor
                                       fontSize:(CGFloat)fontSize;

#pragma mark - For UITextView
+ (UITextView *)createTextViewWithTextColor:(UIColor *)textColor
                                   fontSize:(CGFloat)fontSize;

@end
