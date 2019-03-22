//
//  DemoViewController2.m
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "DemoViewController2.h"
#import "DemoTableViewCell.h"

@interface DemoViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic, assign) NSInteger index;

@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUIView];
    
   // [JYPLogLoadingView showInView:self.view];
    
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)initUIView
{
    WEAK
    self.dataSource = [NSMutableArray arrayWithObjects:@"数据", nil];
    
    self.navigationItem.title = @"列表";
    [self addRightBarButtonWithFirstImage:[UIImage imageNamed:@"Bar_add"] action:@selector(rightBarBtnAction)];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 40;
   // self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"DemoTableViewCell" bundle:nil] forCellReuseIdentifier:kDemoTableViewCellID];
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
         //   [JYPLogLoadingView dismissInView:self.view];
            
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
    [self.navigationController pushViewControllerStringMu:NameToString(RegistHousingVController) animated:YES parameters:^(NSMutableDictionary *dict) {
        
    }];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDemoTableViewCellID];
    // cell.titleLab.text = [NSString stringWithFormat:@"第%ld组  第%ld行",indexPath.section,indexPath.row];
    cell.titleLab.text = [NSString stringWithFormat:@"UITableViewCell %ld",indexPath.row];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewAutomaticDimension;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}


@end
