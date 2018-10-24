//
//  HomeViewController.m
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeUIService.h"

@interface HomeViewController ()<UINavigationControllerDelegate>

/**
 *首页UI
 */
@property (nonatomic,strong)HomeUIService *homeUIService;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];


    // 设置导航控制器的代理为self
    self.navigationController.delegate = self;
    self.homeUIService = [[HomeUIService alloc] initWithVC:self];

    
}

/**
 * 创建首页NAVAR
 */
- (void)createNavigationBar
{
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, NAVBAR_HEIGHT)];
    [self.view addSubview:navigationView];
    navigationView.backgroundColor = [UIColor gradientFromColor:[UIColor firstAppNavigationBarColor] toColor:[UIColor lastAppNavigationBarColor] withWidth:KWIDTH];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnAction:(UIButton *)sender
{
    [self.navigationController pushViewControllerStringMu:NameToString(FocusHousingListController) animated:YES parameters:nil];
}

- (void)firstItemBtnAction:(UIButton *)sender
{
    [self.navigationController pushViewControllerStringMu:NameToString(DemoViewController2) animated:YES parameters:nil];
}

- (void)secondItemAction
{
//    [CGXPickerView showDatePickerWithTitle:@"" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:@"1900-01-01" MaxDateStr:@"2018-05-30" IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
//        NSLog(@"%@",selectValue);
//    }];
    
    [self.navigationController pushViewControllerStringMu:NameToString(AMapViewController) animated:YES parameters:nil];
    
}

#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

@end
