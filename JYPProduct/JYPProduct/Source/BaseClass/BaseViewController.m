//
//  BaseViewController.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 控制器背景
    self.view.backgroundColor = [UIColor appBackGroundColor];
  
    // 返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        [self addLeftBarButtonWithImage:[UIImage imageNamed:@"Bar_back"] action:@selector(backAction)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 返回上一页
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 回收键盘
- (void)hideKeyboardTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToHideKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tapToHideKeyboard {
    [self.view endEditing:YES];
}



#pragma mark - 集成tableView刷新
- (void)setupRefreshFortableView:(UITableView *)tableView WithAction:(SEL)headerRereshing and:(SEL)footderReReshing
{
    if (headerRereshing) {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:headerRereshing];
    }
    if (footderReReshing) {
        tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:footderReReshing];
    }
}


@end
