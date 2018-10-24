
//
//  HomeUIService.m
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeUIService.h"
#import "HomeViewController.h"
#import "HomeNavigationView.h"
#import "HomeManageTableViewCell.h"
#import "HomeNoticeTableViewCell.h"
#import "HomeManageHeaderView.h"
#import "HomeWaitWorkTableCell.h"
#import "HomeCensusTableViewCell.h"

@interface HomeUIService()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)HomeViewController *homeVC;

/**
 *自定义导航条
 */
@property (nonatomic, strong)HomeNavigationView *navigationView;

@end


@implementation HomeUIService


- (instancetype)initWithVC:(UIViewController *)VC {
    
    self.homeVC = (HomeViewController *)VC;
//    self.homeVC.view.backgroundColor = HexColor(@"#EFEFF4");
    
    [self.homeVC.view addSubview:self.homeTableView];
    
    // 创建首页NAVAR
    [self createNavigationBar];
    
    
    
    return self;
}

/**
 * 创建首页NAVAR
 */
- (void)createNavigationBar
{
    self.navigationView = [[HomeNavigationView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, NAVBAR_HEIGHT)];
    [self.homeVC.view addSubview:self.navigationView];
    self.navigationView.title = @"全房通";
}

/**
 *UITableView
 */
- (UITableView *)homeTableView
{
    if (_homeTableView == nil) {
        
        NSLog(@"%f - %f -  %f",KHEIGHT,TABBAR_HEIGHT,NAVBAR_HEIGHT);
        
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHT, KWIDTH, KHEIGHT-(TABBAR_HEIGHT+NAVBAR_HEIGHT))
                                                      style:UITableViewStyleGrouped];
        
        NSLog(@"---%f",TABBAR_HEIGHT+NAVBAR_HEIGHT);
        NSLog(@"%f",_homeTableView.frame.size.height);
        
        [_homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _homeTableView.backgroundColor = [UIColor clearColor];
        _homeTableView.separatorStyle= UITableViewCellSeparatorStyleNone;
        _homeTableView.showsVerticalScrollIndicator = NO;
        
        _homeTableView.dataSource = self;
        _homeTableView.delegate = self;
        
        NSArray *cellIDArray = @[
                                 @"HomeManageTableViewCell",
                                 @"HomeNoticeTableViewCell",
                                 @"HomeWaitWorkTableCell",
                                 @"HomeCensusTableViewCell"
                                 ];
        for (NSString *cellID in cellIDArray) {
            [_homeTableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
        }
        
    }
    return _homeTableView;
}

#pragma mark - UITableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HomeManageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeManageTableViewCell"];
        return cell;
    }
    else if (indexPath.section == 1){
        HomeNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeNoticeTableViewCell"];
        return cell;
    }
    else if (indexPath.section == 2){
        HomeWaitWorkTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeWaitWorkTableCell"];
        return cell;
    }
    else if (indexPath.section == 4){
        HomeCensusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCensusTableViewCell"];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        [self.homeVC.navigationController pushViewControllerStringMu:NameToString(DemoViewController2) animated:YES parameters:nil];
    }else if (indexPath.section == 2){
        [self.homeVC.navigationController pushViewControllerStringMu:NameToString(ManualModeViewController) animated:YES parameters:nil];
    }else if (indexPath.section == 3){
        [self.homeVC.navigationController pushViewControllerStringMu:NameToString(FocusHousingListController) animated:YES parameters:^(NSMutableDictionary *dict) {
            
        }];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 140;
    }else if (indexPath.section == 1){
        return 126;
    }else if (indexPath.section == 2){
        return 40;
    }else if (indexPath.section == 3){
        return 160;
    }else if (indexPath.section == 4){
        return 120;
    }
    return 140;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HomeManageHeaderView *headerView = [HomeManageHeaderView viewFromXibName:@"HomeManageHeaderView"];
    switch (section) {
        case 0:
        {
            return nil;
        }
            break;
        case 1:
        {
            return nil;
        }
            break;
        case 2:
        {
            headerView.titleLab.text = @"我的代办";
            headerView.imageView.image = UIImageNamed(@"Home_WaitWork");
            return headerView;
        }
            break;
        case 3:
        {
            headerView.titleLab.text = @"空置提醒";
            headerView.imageView.image = UIImageNamed(@"Home_Vacant");
            return headerView;
        }
            break;
        case 4:
        {
            headerView.titleLab.text = @"业绩统计";
            headerView.imageView.image = UIImageNamed(@"Home_Census");
            return headerView;
        }
            break;

        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 0.001;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        return 0.001;
    }
    return 10;
}



@end
