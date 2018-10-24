//
//  JYPLogLoadingView.h
//  JYPProduct
//
//  Created by apple on 2018/5/31.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYPLogLoadingView : UIView

-(void)show;

-(void)dismiss;

+(void)showInView:(UIView*)view;

+(void)dismissInView:(UIView*)view;

+ (void)showInWindow;

+ (void)dismissInWindow;

@end
