//
//  RegistHousingView.m
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "RegistHousingView.h"

#define ITEMVIEWHEIGHT 44

//// Masonry 底部安全区域
//#define iOS11MAS_SAFEAREALAYOUGUIDEBOTTOM \
//{   \
//if (iOS11) {\
//make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);\
//}else{\
//make.bottom.equalTo(self.view.mas_bottom);\
//}\
//}

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
        DLog(@"输入框内容===%@",text);
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
    
    
}

#pragma mark - 点击事件
/**
 *区域
 */
- (void)areaViewBtnAction {
    DLog(@"111");
    self.areaView.name  = @"晋";
    self.areaView.value = @"亚鹏";
}

/**
 *物业地址
 */
- (void)addressViewBtnAction {
    DLog(@"222");
}

/**
 *座栋
 */
- (void)buildViewBtnAction
{
    
}










@end
