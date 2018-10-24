//
//  UIView+Radius.h
//  JYPProduct
//
//  Created by apple on 2018/9/3.
//  Copyright © 2018年 JYP. All rights reserved.
//  为UIView设置单个切角

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,UIViewRadiusType) {
    
    UIViewRadiusTypeNone      =   0,  // 无特别限制，四个角全切
    UIViewRadiusTypeTopLeft,          // 左上
    UIViewRadiusTypeTopRight,         // 右上
    UIViewRadiusTypeBottomLeft,       // 左下
    UIViewRadiusTypeBottomRight       // 右下
};

@interface UIView (Radius)

- (void)cornerRadius:(CGFloat)cornerRadius withUIViewRadiusType:(UIViewRadiusType)type;

@end
