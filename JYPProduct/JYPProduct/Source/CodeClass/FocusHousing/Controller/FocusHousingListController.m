//
//  FocusHousingListController.m
//  JYPProduct
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "FocusHousingListController.h"

@interface FocusHousingListController ()

@end

@implementation FocusHousingListController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationController.navigationBar.translucent  = NO;
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    

    UIButton *btn = [CBUIKit createButtonWithTitle:@"点击" fontSize:15 titleColor:[UIColor whiteColor]];
    btn.frame = CGRectMake(100, 250, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    btn.clickInterval = 10;
    
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)btnAction:(UIButton *)sender {
    
    NSLog(@"-----------1");
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
