//
//  UINavigationController+NavigationExtension.h
//  JYPProduct
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NavigationExtension)

/**
 @param controllerString UIController's name 控制器字符串，用于解耦，不需要导入控制器的头文件，配合NameToString这个宏使用会更好
 @param parameter A block object which used to passing parameters to 'controllerString' 把需要传递给‘controllerString’控制器的参数写在字典里
 */
-(void)pushViewControllerStringMu:(NSString *)controllerString animated:(BOOL)animated parameters:(void (^)(NSMutableDictionary * dict))parameter;



/**
 @param viewController UIController 控制器字符串，用于解耦，不需要导入控制器的头文件，配合NameToString这个宏使用会更好
 @param parameter A block object which used to passing parameters to 'controllerString'把需要传递给‘controllerString’控制器的参数写在字典里
 */
-(void)pushViewControllerMu:(UIViewController *)viewController animated:(BOOL)animated parameters:(void (^)(NSMutableDictionary * dict))parameter;


@end
