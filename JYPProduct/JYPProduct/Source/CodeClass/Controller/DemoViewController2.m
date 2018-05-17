//
//  DemoViewController2.m
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "DemoViewController2.h"
#import "DemoTableViewCell.h"
#import "RegistHousingVController.h"

@interface DemoViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUIView];
    
}

- (void)initUIView
{
    
    self.navigationItem.title = @"列表";
    [self addRightBarButtonWithFirstImage:[UIImage imageNamed:@"Bar_add"] action:@selector(rightBarBtnAction)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"DemoTableViewCell" bundle:nil] forCellReuseIdentifier:DemoTableViewCellID];
}


- (void)rightBarBtnAction
{
    RegistHousingVController *VC = [[RegistHousingVController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DemoTableViewCellID];
    cell.titleLab.text = [NSString stringWithFormat:@"第%ld组  第%ld行",indexPath.section,indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}


@end
