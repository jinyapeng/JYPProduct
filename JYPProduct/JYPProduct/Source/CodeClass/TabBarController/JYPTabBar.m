//
//  JYPTabBar.m
//  JYPProduct
//
//  Created by apple on 2018/5/30.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "JYPTabBar.h"

@implementation JYPTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //为保证动画不会重复以及点击动画的正确性，特增加selectTabBarTag， 保证selectTabBarTag和当前tabBarController.selectedIndex一致。
        self.selectTabBarTag = 1;
        
        /**
         *添加阴影
         */
//        self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//        self.layer.shadowOpacity = 0.2;//阴影透明度，默认0
//        self.layer.shadowOffset = CGSizeMake(0,0);
//        self.layer.shadowRadius = 2;//阴影半径，默认3
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        
//        [path moveToPoint:CGPointMake(0, -2)];
//        [path addLineToPoint:CGPointMake(KWIDTH, -2)];
//        [path addLineToPoint:CGPointMake(KWIDTH, 1)];
//        [path addLineToPoint:CGPointMake(0, 1)];
//        [path addLineToPoint:CGPointMake(0, -2)];
//        
//        self.layer.shadowPath = path.CGPath;
        
        //修改tabBar顶部线条
        [self setBackgroundImage:[UIImage new]];
        //可以设置线条的高度和颜色值，[QuickCreatTreasureBox hexChangeFloat:@"eeeeee"]这个是我封装的一个根据16进制数组来转成UIColor的方法，SCREEN_WIDTH是屏幕的宽度。
        [self setShadowImage:[self imageWithColor:HexColor(@"#e5e5e5") size:CGSizeMake(KWIDTH, 0.5)]];
    }
    return self;
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    NSInteger index = [self.items indexOfObject:self.selectedItem];
    if (index != self.selectTabBarTag) {
        for (UIView *imageView in tabBarButton.subviews) {
            if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                [self selectTabBarDoScaleAnimationWithView:imageView];
            }
        }
    }
    
    self.selectTabBarTag = index;
}

- (void)selectTabBarDoScaleAnimationWithView:(UIView *)animationView{
    //需要实现的帧动画,这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.1,@0.9,@1.05,@0.95,@1.02,@1.0];
    animation.duration = 0.6;
    animation.calculationMode = kCAAnimationCubic;
    //把动画添加上去就OK了
    [animationView.layer addAnimation:animation forKey:nil];
}

#pragma mark - Associated Object
- (void)setSelectTabBarTag:(NSInteger)object{
    objc_setAssociatedObject(self, @selector(selectTabBarTag), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSInteger)selectTabBarTag{
    return [objc_getAssociatedObject(self, @selector(selectTabBarTag)) integerValue];
}

//根据颜色生成图片的函数
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}



@end
