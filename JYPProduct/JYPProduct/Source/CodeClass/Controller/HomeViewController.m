//
//  HomeViewController.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeViewController.h"
#import "DemoViewController1.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"首页";
   
    [self addRightTwoBarButtonsWithFirstImage:[UIImage imageNamed:@"Bar_set"] firstAction:@selector(firstItemBtnAction:) secondImage:[UIImage imageNamed:@"Bar_set"] secondAction:@selector(secondItemAction)];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)firstItemBtnAction:(UIButton *)sender
{
    DemoViewController1 *VC = [[DemoViewController1 alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)secondItemAction
{
    [CGXPickerView showDatePickerWithTitle:@"" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:@"1900-01-01" MaxDateStr:@"2018-05-30" IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
        NSLog(@"%@",selectValue);
    }];
}


@end
