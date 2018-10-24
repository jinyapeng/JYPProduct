//
//  BaseTabBarController.m
//  JYPProduct
//
//  Created by apple on 2018/5/30.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseTabBarController.h"
#import "JYPTabBar.h"

@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.delegate = self;
    
    // kvc实质是修改了系统的_tabBar
    JYPTabBar * tab = [[JYPTabBar alloc] init];
    tab.backgroundColor = [UIColor whiteColor];
    [self setValue:tab forKeyPath:@"tabBar"];
    
    // 添加控制器
    /**
     * 首页
     * homeType old老版本；new 新版本
     */
    UIViewController *homeVC = ClassName(HomeViewController);
    [self addChildVC:homeVC title:@"首页" imageName:@"tabBar_01" selectImageName:@"tabBar_01Select"];
    
    // 出门
    UIViewController *VC1 = ClassName(ChartsViewController);
    [self addChildVC:VC1 title:@"出门" imageName:@"tabBar_02" selectImageName:@"tabBar_02Select"];
    
    // 通讯录
    UIViewController *VC2 = ClassName(UIViewController);
    [self addChildVC:VC2 title:@"通讯录" imageName:@"tabBar_03" selectImageName:@"tabBar_03Select"];
    
    // 设置
    UIViewController *VC3 = ClassName(UIViewController);
    [self addChildVC:VC3 title:@"我的" imageName:@"tabBar_05" selectImageName:@"tabBar_05Select"];
    
    
}

+(void)initialize
{
    UITabBarItem *barBarItem = [UITabBarItem appearance];
    [barBarItem setTitlePositionAdjustment:UIOffsetMake(2, -3)];
    /**
     * 设置选中文字的颜色
     * 选中，未选中
     */
    NSDictionary *dict=@{NSForegroundColorAttributeName:rgb(73, 105, 242, 1)};
    [barBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    NSDictionary *normalDict=@{NSForegroundColorAttributeName:rgb(153, 153, 153, 1)};
    [barBarItem setTitleTextAttributes:normalDict forState:UIControlStateNormal];
}

-(void)addChildVC:(UIViewController*)VC title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName
{
    // 设置导航栏
    BaseNavigationViewController *naVC = [[BaseNavigationViewController alloc] initWithRootViewController:VC];
    VC.navigationItem.title = title;
    
    // tabbar文字
    naVC.tabBarItem.title  = title;
    
    // 未选中时的图片
    UIImage *image  = UIImageNamed(imageName);
    naVC.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
   
    // 选中后的图片
    UIImage *selectImage  = UIImageNamed(selectImageName);
    naVC.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:naVC];
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
