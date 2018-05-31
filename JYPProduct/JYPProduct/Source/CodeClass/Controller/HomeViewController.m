//
//  HomeViewController.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"首页";
   
    [self addRightTwoBarButtonsWithFirstImage:UIImageNamed(@"Bar_set") firstAction:@selector(firstItemBtnAction:)
                                  secondImage:UIImageNamed(@"Bar_set") secondAction:@selector(secondItemAction)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)firstItemBtnAction:(UIButton *)sender
{
//    UIViewController *VC = ClassName(DemoViewController2);
//    [self.navigationController pushViewControllerMu:VC animated:YES parameters:^(NSMutableDictionary *dict) {
//        [dict setObject:@"housing" forKey:@"saletype"];
//        
//    }];
    
    [self.navigationController pushViewControllerStringMu:NameToString(DemoViewController2) animated:YES parameters:^(NSMutableDictionary *dict) {
        
    }];
    
}

- (void)secondItemAction
{
    [CGXPickerView showDatePickerWithTitle:@"" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:@"1900-01-01" MaxDateStr:@"2018-05-30" IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
        NSLog(@"%@",selectValue);
    }];
}


@end
