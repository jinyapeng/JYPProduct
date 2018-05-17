//
//  DemoTableViewCell.m
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.space = 10;
    [self setSeparatorLineType:SeparatorLineTypeRightShortBottom];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
