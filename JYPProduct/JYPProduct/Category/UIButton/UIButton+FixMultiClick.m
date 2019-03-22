//
//  UIButton+FixMultiClick.m
//  JYPProduct
//
//  Created by Apple on 2019/3/5.
//  Copyright © 2019年 JYP. All rights reserved.
//

#import "UIButton+FixMultiClick.h"
#import <objc/runtime.h>
#import <Aspects/Aspects.h>

@interface UIButton ()
@property (nonatomic, assign) NSTimeInterval clickTime;

@end

@implementation UIButton (FixMultiClick)

-(NSTimeInterval)clickTime {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
-(void)setClickTime:(NSTimeInterval)clickTime {
    objc_setAssociatedObject(self, @selector(clickTime), @(clickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSTimeInterval)clickInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
-(void)setClickInterval:(NSTimeInterval)clickInterval {
    objc_setAssociatedObject(self, @selector(clickInterval), @(clickInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+(void)load {
    [UIButton aspect_hookSelector:@selector(sendAction:to:forEvent:)
                      withOptions:AspectPositionInstead
                       usingBlock:^(id<AspectInfo> info){
                           UIButton *obj = info.instance;
                           if(obj.clickInterval <= 0){
                               [info.originalInvocation invoke];
                           }
                           else{
                               if ([NSDate date].timeIntervalSince1970 - obj.clickTime < obj.clickInterval) {
                                   return;
                               }
                               obj.clickTime = [NSDate date].timeIntervalSince1970;
                               [info.originalInvocation invoke];
                           }
                       } error:nil];
}

@end
