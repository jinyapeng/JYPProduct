//
//  ChartsViewController.m
//  JYPProduct
//
//  Created by apple on 2018/6/5.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "ChartsViewController.h"
#import "JYPProduct-Bridging-Header.h"

@interface ChartsViewController ()

//@property (nonatomic,strong)BarChartView *barView;

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"业绩分析";
    
//    self.barView = [[BarChartView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 150)];
//    _barView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_barView];
//
//    // 1. 基本样式
//    _barView.chartDescription.text = @"";//右下角描述
//    _barView.drawBarShadowEnabled  = NO;//是否绘制阴影背景
//    _barView.drawValueAboveBarEnabled = YES;//数值显示是否在条柱上面
//    _barView.noDataText = NSLocalizedString(@"加载中...", nil);//没有数据时的显示
//    _barView.rightAxis.enabled = NO;//是否画右边坐标轴
//    _barView.legend.enabled = NO;//是否显示图例说明
//    _barView.dragEnabled = NO;//是否启用拖拽图表
//
//    // 2.交互设置
//    _barView.doubleTapToZoomEnabled = NO;//双击是否缩放
//    _barView.scaleXEnabled = NO;//X轴缩放
//    _barView.scaleYEnabled = NO;//Y轴缩放
//    _barView.pinchZoomEnabled = NO;//XY轴是否同时缩放
//
//    // 3.X轴式样设置
//    ChartXAxis *xAxis    = _barView.xAxis;
//    xAxis.drawGridLinesEnabled = YES;//是否绘制网格
//    xAxis.gridColor       = HexColor(@"#e5e5e5");// 网格的颜色
//    xAxis.labelFont      = [UIFont systemFontOfSize:10.0f];//x数值字体大小
//    xAxis.labelCount     = 20;// 坐标轴上最多显示多少个坐标点
//    xAxis.granularity    = 1.0;
//    xAxis.labelPosition  = XAxisLabelPositionBottom;//X轴的显示位置
//    xAxis.labelTextColor = [UIColor blackColor];//数值字体颜色
//    //xAxis.gridLineDashLengths = @[@2.f, @5.f];
//
//    xAxis.wordWrapWidthPercent = 10;
//
//    // 4.Y轴式样设置
//    _barView.rightAxis.drawLabelsEnabled = NO;// 是否显示右边Y轴数值
//    ChartYAxis *leftAxis = _barView.leftAxis;
//    leftAxis.enabled     = YES;// 是否显示坐标轴
//    leftAxis.forceLabelsEnabled   = NO;
//    leftAxis.drawGridLinesEnabled = YES;//是否绘制网格
//    leftAxis.gridColor            = HexColor(@"#e5e5e5");// 网格的颜色
//    leftAxis.drawZeroLineEnabled  = NO;//从0开始绘画
//    leftAxis.drawLabelsEnabled    = NO;// 隐藏y轴数值
//    leftAxis.labelPosition  = YAxisLabelPositionOutsideChart;//坐标数值的位置
//    leftAxis.labelFont      = [UIFont systemFontOfSize:10.f];//字体大小
//    leftAxis.labelTextColor = [UIColor blackColor];//坐标数值字体颜色
//    leftAxis.axisLineColor  = [UIColor clearColor];//Y轴颜色
//    leftAxis.spaceTop       = 0.1;//最大值到顶部的范围比
//    leftAxis.axisLineWidth  = 1;//Y轴线宽
//
//    _barView.legend.enabled = NO;//不显示图例说明
//
//    _barView.data = [self setData];
//    [_barView animateWithXAxisDuration:1.0f];
//
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

////为柱形图设置数据
//- (BarChartData *)setData
//{
//    NSMutableArray *xVals = [[NSMutableArray alloc] init];// X轴上面需要显示的数据
//    NSMutableArray *yVals = [[NSMutableArray alloc] init];// 对应Y轴上面需要显示的数据
//    
//    for (int i = 0; i < 7; i++){
//      
//        [xVals addObject:@"02-21"];
//        [yVals addObject:[[BarChartDataEntry alloc] initWithX:(double)i y:(i+1)*2]];
//        
//    }
//    
//  //  _barView.xAxis.valueFormatter = [[DateValueFormatter alloc]initWithArr:xVals];
//    
//    //创建BarChartDataSet对象，其中包含有Y轴数据信息，以及可以设置柱形样式
//    BarChartDataSet *set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@"The year 2017"];
//    
//    //区块颜色
//    NSMutableArray *colors = [[NSMutableArray alloc] init];
//    [colors addObject: HexColor(@"#F88A38")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    [colors addObject:HexColor(@"#FECEA7")];
//    set1.colors = colors;
//    
//    //创建BarChartData对象, 此对象就是barChartView需要最终数据对象
//    NSMutableArray *dataSets = [[NSMutableArray alloc] initWithObjects:set1, nil];
//    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
//    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];//文字字体
//    [data setValueTextColor:HexColor(@"#333333")];//文字颜色
//    
//    //自定义数据显示格式
//    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
//    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
//    pFormatter.maximumFractionDigits = 4;
//    pFormatter.multiplier = @1.f;
//    pFormatter.percentSymbol = @"";
//    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
//    
//    data.barWidth = 0.4f;
//    
//    return data;
//}

@end
