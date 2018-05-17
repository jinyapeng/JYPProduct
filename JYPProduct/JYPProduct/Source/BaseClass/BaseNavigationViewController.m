//
//  BaseNavigationViewController.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

+(void)initialize
{
    UINavigationBar *navigation = [UINavigationBar appearance];
    navigation.backgroundColor  = [UIColor clearColor];
    navigation.barTintColor     = [UIColor appMainColor];
    navigation.translucent      = NO;
    [navigation setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [navigation setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0],
                                         NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 隐藏tabbar
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


@end
