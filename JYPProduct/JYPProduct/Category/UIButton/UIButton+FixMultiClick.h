//
//  UIButton+FixMultiClick.h
//  JYPProduct
//
//  Created by Apple on 2019/3/5.
//  Copyright © 2019年 JYP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FixMultiClick)

@property (nonatomic, assign) NSTimeInterval clickInterval;

@end

NS_ASSUME_NONNULL_END
