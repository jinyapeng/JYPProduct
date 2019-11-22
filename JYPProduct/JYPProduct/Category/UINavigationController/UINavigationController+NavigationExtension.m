//
//  UINavigationController+NavigationExtension.m
//  JYPProduct
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "UINavigationController+NavigationExtension.h"

@implementation UINavigationController (NavigationExtension)

-(void)pushViewControllerMu:(UIViewController *)viewController animated:(BOOL)animated parameters:(void (^)(NSMutableDictionary *))parameter{
    if (!viewController) {
        return;
    }
    NSMutableDictionary * dict= [NSMutableDictionary dictionary];
    if (parameter) {
        parameter(dict);
    }
    [viewController yy_modelSetWithDictionary:dict];
    [self pushViewController:viewController animated:animated];
}


-(void)pushViewControllerStringMu:(NSString *)controllerString animated:(BOOL)animated parameters:(void (^)(NSMutableDictionary *))parameter{
    if (!controllerString) {
        return;
    }
    UIViewController *controller = [NSClassFromString(controllerString) new];
    NSMutableDictionary * dict   = [NSMutableDictionary dictionary];
    if (parameter) {
        parameter(dict);
    }
    [controller yy_modelSetWithDictionary:dict];
    [self pushViewController:controller animated:animated];
}


-(void)pushViewControllerStringMu:(NSString *)controllerString animated:(BOOL)animated parameter:(NSMutableDictionary *)parameter operationBlock:(void (^)(id))operation {
    if (!controllerString) {
        return;
    }
    UIViewController *controller = [NSClassFromString(controllerString) new];
    if (parameter) {
        [controller yy_modelSetWithDictionary:parameter];
    }
    
    controller.operationBlock    = operation;
    [self pushViewController:controller animated:animated];
}



-(void)pushViewControllerStringMu:(NSString *)controllerString animated:(BOOL)animated parameters:(void (^)(NSMutableDictionary *))parameter operationBlock:(void (^)(id))operation {
    if (!controllerString) {
        return;
    }
    UIViewController *controller = [NSClassFromString(controllerString) new];
    NSMutableDictionary * dict   = [NSMutableDictionary dictionary];
    if (parameter) {
        parameter(dict);
    }
    controller.operationBlock    = operation;
    [controller yy_modelSetWithDictionary:dict];
    [self pushViewController:controller animated:animated];
}



@end
