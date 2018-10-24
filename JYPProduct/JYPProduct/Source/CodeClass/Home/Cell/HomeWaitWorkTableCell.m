//
//  HomeWaitWorkTableCell.m
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeWaitWorkTableCell.h"

@implementation HomeWaitWorkTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.statusLab.layer.cornerRadius= 4.0;
    self.statusLab.layer.borderWidth = 1;
    self.statusLab.layer.borderColor = rgb(241, 90, 74, 0.8).CGColor;
    
    self.space = 0;
    [self setSeparatorLineType:SeparatorLineTypeRightShortBottom];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
