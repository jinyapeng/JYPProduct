//
//  ManualModeTableViewCell.m
//  JYPProduct
//
//  Created by apple on 2018/8/21.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "ManualModeTableViewCell.h"

@implementation ManualModeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(Model_Manual *)model
{
    _model = model;
    
    [self.monthBtn setTitle:[NSString stringWithFormat:@"%d",model.month] forState:UIControlStateNormal];
    
    [self.dayBtn   setTitle:[NSString stringWithFormat:@"%d",model.day]   forState:UIControlStateNormal];
    
    self.contentLab.text = [NSString stringWithFormat:@"%@ -- %@",model.star,model.end];
    
    self.countLab.text = [NSString stringWithFormat:@"第%d次缴费",model.count];
    
}


@end
