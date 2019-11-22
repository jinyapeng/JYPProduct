//
//  ChartsViewController.m
//  JYPProduct
//
//  Created by apple on 2018/6/5.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "ChartsViewController.h"
#import "PNChart.h"

@interface ChartsViewController ()

@property (nonatomic,strong)NSString *roomId;
@property (nonatomic,strong)NSString *tempKey;

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"业绩分析";
    

    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    // Line Chart No.1
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    lineChart.chartData = @[data01, data02];
    [lineChart strokeChart];
   
    lineChart.showSmoothLines = YES;
    
    [self.view addSubview:lineChart];
    
   
    
 //   self.operationBlock(@{@"1":@"2"});
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
