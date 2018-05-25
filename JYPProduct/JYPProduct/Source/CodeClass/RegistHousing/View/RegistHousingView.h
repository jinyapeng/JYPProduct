//
//  RegistHousingView.h
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistHoisingItem.h"

@interface RegistHousingView : UIView

@property (nonatomic,strong)RegistHoisingItem *areaView;   // 区域
@property (nonatomic,strong)RegistHoisingItem *addressView;// 物业地址
@property (nonatomic,strong)RegistHoisingItem *buildView;  // 座栋
@property (nonatomic,strong)RegistHoisingItem *houseNumView;// 门牌号
@property (nonatomic,strong)RegistHoisingItem *houseAreaView;// 建筑面积
@property (nonatomic,strong)RegistHoisingItem *houseDoorView;// 户型
@property (nonatomic,strong)RegistHoisingItem *houseTypeView;// 房屋类型



@end
