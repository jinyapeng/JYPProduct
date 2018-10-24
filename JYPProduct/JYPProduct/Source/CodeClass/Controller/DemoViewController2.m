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
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic, assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollerView.contentSize = CGSizeMake(KWIDTH, 1000);
    
//    [self.scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view2.mas_bottom).offset(10);
//    }];
    
//    [self.scrollerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view2.mas_bottom).offset(10);
//    }];
    
    
    [self initUIView];
    
    [JYPLogLoadingView showInView:self.view];
    [self requestData];
}

- (void)initUIView
{
    WEAK
    self.dataSource = [NSMutableArray new];
    
    self.navigationItem.title = @"列表";
    [self addRightBarButtonWithFirstImage:[UIImage imageNamed:@"Bar_add"] action:@selector(rightBarBtnAction)];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"DemoTableViewCell" bundle:nil] forCellReuseIdentifier:DemoTableViewCellID];
    self.tableView.ly_emptyView = [JYPDIYEmpty diyNoNetworkEmptyWithTarget:self action:@selector(addObjectAction)];
    
    //pull request
    [JYPMethodTools gifHeaderRefreshWithTableView:self.tableView completion:^{
        STRONG
        [self requestData];
    }];
    
    [JYPMethodTools footerRefreshWithTableView:self.tableView completion:^{
        STRONG
        [self requestData];
    }];
    

}


- (void)requestData{
    
    //网络请求时调用
    [self.tableView ly_startLoading];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        sleep(1);
        _index ++;
        
        NSArray *arr;
        if (_index % 2 == 0) {
            arr = @[@"数据1"];
        }
        [self.dataSource addObjectsFromArray:arr];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [JYPLogLoadingView dismissInView:self.view];
            
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            [self.tableView ly_endLoading];//调用时机
        });
    });
}

- (void)addObjectAction
{
    [self.dataSource addObject:@"数据"];
    [self.tableView reloadData];
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
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
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
