//
//  ManualModeTableViewCell.h
//  JYPProduct
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "Model_Manual.h"

@interface ManualModeTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIButton *monthBtn;
@property (weak, nonatomic) IBOutlet UIButton *dayBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *countLab;

@property (nonatomic,strong)Model_Manual *model;


@end
