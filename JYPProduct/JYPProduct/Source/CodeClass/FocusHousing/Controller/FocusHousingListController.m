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
    
    
    UIView *view = [CBUIKit createViewWithBgColor:[UIColor redColor]];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
    
    [view cornerRadius:15 withUIViewRadiusType:UIViewRadiusTypeTopLeft];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
