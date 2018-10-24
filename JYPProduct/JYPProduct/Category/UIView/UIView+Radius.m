//
//  UIView+Radius.m
//  JYPProduct
//
//  Created by apple on 2018/9/3.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "UIView+Radius.h"

@implementation UIView (Radius)

- (void)cornerRadius:(CGFloat)cornerRadius withUIViewRadiusType:(UIViewRadiusType)type
{
    self.clipsToBounds = YES;
    UIBezierPath *cornerRadiusPath;
    switch (type) {
        case UIViewRadiusTypeNone:
        {
            cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case UIViewRadiusTypeTopLeft:
        {
            cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            
        }
            break;
        case UIViewRadiusTypeTopRight:
        {
            cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case UIViewRadiusTypeBottomLeft:
        {
            cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case UIViewRadiusTypeBottomRight:
        {
            cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
            
        default:
            break;
    }
    
    
    CAShapeLayer *cornerRadiusLayer = [ [CAShapeLayer alloc ] init];
    cornerRadiusLayer.frame = self.bounds;
    cornerRadiusLayer.path = cornerRadiusPath.CGPath; self.layer.mask = cornerRadiusLayer;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(15, 15)];
    
}



@end
