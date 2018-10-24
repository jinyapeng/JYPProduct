//
//  ManualModeViewController.m
//  JYPProduct
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "ManualModeViewController.h"
#import "ManualModeTableViewCell.h"
#import "Model_Manual.h"

@interface ManualModeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray <Model_Manual *>*dateArray;

/**
 *缴费方式 租赁期限
 */
@property (nonatomic,assign)int payMent;

@property (nonatomic,assign)int year;

@property (nonatomic,assign)int month;

@property (nonatomic,assign)int day;


@end

@implementation ManualModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"手动模式";
    
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ManualModeTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    self.payMent = 4;
    
    self.year    = 3;
    
    self.month   = 0;
    
    self.day     = 0;
    
    self.dateArray = [NSMutableArray new];
    
    for (int i = 0; i < (self.year*12)/self.payMent; i ++) {
        
        Model_Manual *model = [[Model_Manual alloc] init];
        model.count = i+1;
        model.month = self.payMent;
        model.day   = 0;
        
        model.star  = [NSDate offsetMonths:i*self.payMent     fromDate:@"2018-01-01" Formatter:@"yyyy-MM-dd"];
        model.end   = [NSDate offsetYears:0 Months:(i+1)*self.payMent Days:-1 fromDate:@"2018-01-01" Formatter:@"yyyy-MM-dd"];
        
        [self.dateArray addObject:model];
    }
    
    
    // [self p_jsWithMonth:3 day:0 atIndex:0 count:10 starTime:@"2018-01-01"];
    
    [self.tableView reloadData];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dateArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManualModeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.model = self.dateArray[indexPath.section];
    cell.dayBtn.tag = indexPath.section +1000;
    cell.monthBtn.tag = indexPath.section +5000;
    
    [cell.dayBtn addTarget:self action:@selector(dayBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.monthBtn addTarget:self action:@selector(monthBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

#pragma mark - 计算手动模式
- (void)monthBtnAction:(UIButton *)sender
{
    int index = (int)sender.tag - 5000;
    
    if (index == self.dateArray.count - 1) {
        return;
    }
    
    WEAK
    NSMutableArray *monthArr = [NSMutableArray new];
    for (int i = 1; i <= 12; i ++) {
        [monthArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    [CGXPickerView showStringPickerWithTitle:@"选择月份" DataSource:monthArr  DefaultSelValue:nil IsAutoSelect:NO Manager:nil ResultBlock:^(id selectValue, id selectRow) {
        STRONG
        [sender setTitle:selectValue forState:UIControlStateNormal];
        
        for (int i = index; i < self.dateArray.count; i ++) {
            
            if (i == index) {
                
                self.dateArray[i].month = [selectValue intValue];
                if (i == 0) {
                    self.dateArray[i].star  = [NSDate offsetMonths:i*self.payMent     fromDate:@"2018-01-01" Formatter:@"yyyy-MM-dd"];
                }else{
                    self.dateArray[i].star  = [NSDate offsetYears:0 Months:0 Days:1 fromDate:self.dateArray[i-1].end  Formatter:@"yyyy-MM-dd"];
                }
                self.dateArray[i].end   = [NSDate offsetYears:0 Months:self.dateArray[i].month Days:-1 fromDate:self.dateArray[i].star  Formatter:@"yyyy-MM-dd"];
                
            }else{
                
                self.dateArray[i].star  = [NSDate offsetYears:0 Months:0 Days:1 fromDate:self.dateArray[i-1].end  Formatter:@"yyyy-MM-dd"];
                self.dateArray[i].end   = [NSDate offsetYears:0 Months:self.dateArray[i].month Days:-1 fromDate:self.dateArray[i].star  Formatter:@"yyyy-MM-dd"];
                
            }
        }
        
        
        int monthSum = 0;
        for (Model_Manual *model  in self.dateArray) {
            monthSum = model.month + monthSum;
        }
        
        // 判断是减少还是增加
        //        int temp =  monthSum - self.year*12 + [self.dateArray lastObject].month;
        int temp =  monthSum - self.year*12 ;
        NSLog(@"---   %d",temp);
        
        if (temp == 0) {
            
        }
        // 小于0，说明当前选择的月份不足 房源的租赁期限 需要加相应的月份
        else if (temp < 0)
        {
            
            temp = abs(temp) + [self.dateArray lastObject].month;
            
            if (temp <= self.payMent) {
                
                [self.dateArray lastObject].month =  temp;
                [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
                
            }else{
                
                [self.dateArray lastObject].month =  self.payMent;
                [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
                
                temp -= _payMent;
                
                int count = (temp%_payMent == 0) ? temp/_payMent : temp/_payMent + 1;
                
                for (int i = 0; i < count; i ++) {
                    
                    Model_Manual *model1 = [[Model_Manual alloc] init];
                    model1.count = (int)self.dateArray.count+1;
                    if (i == count-1) {
                        model1.month = temp - i * _payMent;
                    }else{
                        model1.month = self.payMent;
                    }
                    
                    model1.star  = [NSDate offsetYears:0 Months:0 Days:1 fromDate:[self.dateArray lastObject].end  Formatter:@"yyyy-MM-dd"];
                    model1.end   = [NSDate offsetYears:0 Months:model1.month Days:-1 fromDate:model1.star  Formatter:@"yyyy-MM-dd"];
                    
                    [self.dateArray addObject:model1];
                    
                }
                
            }
        }
        
        // 大于0，说明当前选择的月份多余 房源的租赁期限 需要减 相应的月份
        else if (temp > 0){
            
            temp = [self.dateArray lastObject].month - temp;
            
            if (temp > 0) {
                [self.dateArray lastObject].month =  temp;
                [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
            }else if (temp == 0){
                [self.dateArray removeLastObject];
            }else{
                
                [self.dateArray removeLastObject];
                
                temp = [self.dateArray lastObject].month + temp;
                
                while (temp < 0) {
                    
                    [self.dateArray removeLastObject];
                    temp = [self.dateArray lastObject].month + temp;
                    
                }
                
                [self.dateArray lastObject].month =  temp;
                [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
                
                
            }
            
            
        }
        
        
        while ([self.dateArray lastObject].month == 0 || [self.dateArray lastObject].month > self.payMent) {
            
            if ([self.dateArray lastObject].month == 0) {
                
                [self.dateArray removeLastObject];
                
            }else{
                
                // 暂时zhu shi
                int month = [self.dateArray lastObject].month  - self.payMent;
                [self.dateArray lastObject].month =  self.payMent;
                [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
                
                
                Model_Manual *model1 = [[Model_Manual alloc] init];
                model1.count = (int)self.dateArray.count+1;
                
                model1.month = month;
                
                model1.star  = [NSDate offsetYears:0 Months:0 Days:1 fromDate:[self.dateArray lastObject].end  Formatter:@"yyyy-MM-dd"];
                model1.end   = [NSDate offsetYears:0 Months:model1.month Days:-1 fromDate:model1.star Formatter:@"yyyy-MM-dd"];
                
                [self.dateArray addObject:model1];
                
            }
            
        }
        
        
        [self.tableView reloadData];
        
        
    }];
    
}


- (void)p_jsWithMonth:(int)month day:(int)day atIndex:(int)index count:(int)count starTime:(NSString *)starTime
{
    
    for (int i = index; i < count; i ++) {
        Model_Manual *model = [[Model_Manual alloc] init];
        model.month = month;
        model.day   = day;
        
        model.star  = [NSDate offsetMonths:i*month     fromDate:starTime Formatter:@"yyyy-MM-dd"];
        model.end   = [NSDate offsetYears:0 Months:(i+1)*month Days:-1 fromDate:starTime Formatter:@"yyyy-MM-dd"];
        
        [self.dateArray addObject:model];
    }
    
}


- (void)dayBtnAction:(UIButton *)sender
{
    int index = (int)sender.tag - 1000;
    
    if (index == self.dateArray.count - 1) {
        return;
    }
    
    NSMutableArray *daysArray = [NSMutableArray new];
    for (int i = 1; i <= 30; i ++) {
        [daysArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    WEAK
    [CGXPickerView showStringPickerWithTitle:@"选择天数" DataSource:daysArray  DefaultSelValue:nil IsAutoSelect:NO Manager:nil ResultBlock:^(id selectValue, id selectRow) {
        
        STRONG
        NSLog(@"%@",selectRow);
        int daySum = 0;
        for (Model_Manual *model  in self.dateArray) {
            daySum = model.day + daySum;
        }
        
        
        for (int i = index; i < self.dateArray.count; i ++) {
            
            if (i == index) {
                
                self.dateArray[i].day = [selectValue intValue];
                if (i == 0) {
                    self.dateArray[i].star = [NSDate offsetMonths:i*self.payMent     fromDate:@"2018-01-01" Formatter:@"yyyy-MM-dd"];
                }else{
                    self.dateArray[i].star = [NSDate offsetYears:0 Months:0 Days:1 fromDate:self.dateArray[i-1].end  Formatter:@"yyyy-MM-dd"];
                }
                
                self.dateArray[i].end   = [NSDate offsetYears:0 Months:self.dateArray[i].month Days:self.dateArray[i].day-1 fromDate:self.dateArray[i].star  Formatter:@"yyyy-MM-dd"];
                
            }else{
                
                self.dateArray[i].star  = [NSDate offsetYears:0 Months:0 Days:1 fromDate:self.dateArray[i-1].end  Formatter:@"yyyy-MM-dd"];
                self.dateArray[i].end   = [NSDate offsetYears:0 Months:self.dateArray[i].month Days:self.dateArray[i].day-1 fromDate:self.dateArray[i].star  Formatter:@"yyyy-MM-dd"];
                
            }
        }
        
        
        
        int tempDay = 30 - self.dateArray[index].day;
        [self.dateArray lastObject].day = abs(tempDay);
        
        
        
        
        if ([self.dateArray lastObject].day > self.dateArray[index].day) {
            
            [self.dateArray lastObject].day = abs(tempDay);
            
            [self.dateArray lastObject].end = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:[self.dateArray lastObject].day-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
            
        }else{
            
            [self.dateArray lastObject].day   = abs(tempDay);
            [self.dateArray lastObject].month -= 1;
            [self.dateArray lastObject].end   = [NSDate offsetYears:0 Months:[self.dateArray lastObject].month Days:[self.dateArray lastObject].day-1 fromDate:[self.dateArray lastObject].star  Formatter:@"yyyy-MM-dd"];
        }
        
      
        while ([self.dateArray lastObject].month == 0 && [self.dateArray lastObject].day == 0) {
            [self.dateArray removeLastObject];
        }
        
        
    
        [self.tableView reloadData];
        
        
    }];
    
}

@end
