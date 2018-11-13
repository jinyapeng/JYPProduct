//
//  RegistHousingView.m
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "RegistHousingView.h"

#define ITEMVIEWHEIGHT 44

#define MASONRY(objectView,referenceView)\
{\
[objectView mas_makeConstraints:^(MASConstraintMaker *make) {\
    make.left.right.equalTo(self);\
    make.top.equalTo(referenceView.mas_bottom);\
    make.height.mas_equalTo(ITEMVIEWHEIGHT);\
}];\
}

@interface RegistHousingView()

@end

@implementation RegistHousingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setView];
    }
    return self;
}

- (void)p_setView
{
   
    /// 1234567i u 一天会让各方我的企鹅夫人个体户经营韩国发出的风格和你见过热敷。
    
    
    WEAK// 区域
    self.areaView = [RegistHoisingItem btnItemWithTitle:@"区       域" isMust:YES handler:^{
        STRONG
        [self areaViewBtnAction];
    }];
    [self addSubview:self.areaView];
    [self.areaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(ITEMVIEWHEIGHT);
    }];
    
    // 物业地址
    self.addressView = [RegistHoisingItem btnItemWithTitle:@"物业地址" isMust:YES handler:^{
        STRONG
        [self addressViewBtnAction];
    }];
    [self addSubview:self.addressView];
    MASONRY(self.addressView,self.areaView);
   
    // 座栋
    self.buildView = [RegistHoisingItem btnItemWithTitle:@"座       栋" isMust:NO handler:^{
        STRONG
        [self buildViewBtnAction];
    }];
    [self addSubview:self.buildView];
    MASONRY(self.buildView, self.addressView);
    
    // 门牌号
    self.houseNumView = [RegistHoisingItem tfItemWithTitle:@"门  牌  号" isMust:YES subtitle:@"" contentType:UIKeyboardTypeNumbersAndPunctuation  tfChaged:^(NSString *text) {
        NSLog(@"输入框内容===%@",text);
    }];
    [self addSubview:self.houseNumView];
    MASONRY(self.houseNumView, self.buildView);
    
    // 建筑面积
    self.houseAreaView = [RegistHoisingItem tfItemWithTitle:@"建筑面积" isMust:NO subtitle:@"" contentType:UIKeyboardTypeNumbersAndPunctuation tfChaged:^(NSString *text) {}];
    self.houseAreaView.contentType = TFContentTypeFloatNumber;
    [self addSubview:self.houseAreaView];
    MASONRY(self.houseAreaView, self.houseNumView);
    
    // 户型
    self.houseDoorView = [RegistHoisingItem btnItemWithTitle:@"户       型" isMust:YES handler:^{
        
    }];
    [self addSubview:self.houseDoorView];
    MASONRY(self.houseDoorView, self.houseAreaView);
    
    // 房屋类型
    self.houseTypeView = [RegistHoisingItem btnItemWithTitle:@"房屋类型" isMust:YES handler:^{
        
    }];
    [self addSubview:self.houseTypeView];
    MASONRY(self.houseTypeView, self.houseDoorView);
    
    // 建筑面积
    self.houseTypeView = [RegistHoisingItem tfItemWithTitle:@"" isMust:NO subtitle:@"" contentType:UIKeyboardTypeNumbersAndPunctuation tfChaged:^(NSString *text) {
        NSLog(@"-----%@",text);
    }];
    
}

#pragma mark - 点击事件
/**
 *区域
 */
- (void)areaViewBtnAction {
    NSLog(@"111");
    
    // 日期计算 n年后的日期
    NSString *endTime  = [NSDate offsetYears:2 fromDate:@"2017-05-31 12:52:12" Formatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *endMonth = [NSDate offsetMonths:14 fromDate:endTime Formatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *endDays  = [NSDate offsetDays:50 fromDate:endMonth Formatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *endHours = [NSDate offsetHours:25 fromDate:endDays Formatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *endMinutes = [NSDate offsetMinutes:65 fromDate:endHours Formatter:@"yyyy-MM-dd HH:mm:ss"];
    
    NSLog(@"%@ --- %@ --- %@ --- %@ --- %@",endTime,endMonth,endDays,endHours,endMinutes);
    
}

/**
 *物业地址
 */
- (void)addressViewBtnAction {
    
    // 判断时间早晚
    int result = [NSDate compareStarTime:@"2017-05-30" endTime:@"2017-05-31" Formatter:@"yyyy-MM-dd"];
    
    NSLog(@"%d",result);
}

/**
 *座栋
 */
- (void)buildViewBtnAction
{
    
}

/**
 *建筑面积
 */
- (void)removeBuildViewAt
{
    NSString *title = [NSString stringWithFormat:@"%@what %@ is",self.areaView.name,self.areaView.value];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.areaView.name,self.areaView.value, nil];
    
    NSArray *infoArr = [array jk_methodListInfo];
    
    NSLog(@"%@ ---- %@",title,infoArr);
}







@end
