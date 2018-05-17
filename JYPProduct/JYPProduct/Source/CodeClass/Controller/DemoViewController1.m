//
//  DemoViewController1.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "DemoViewController1.h"
#import "DemoViewController2.h"

@interface DemoViewController1 ()

@end

@implementation DemoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"添加";
    [self addRightBarButtonItemWithTitle:@"编辑" action:@selector(rightBarBtnAction)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)rightBarBtnAction
{
    DemoViewController2 *VC = [[DemoViewController2 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
