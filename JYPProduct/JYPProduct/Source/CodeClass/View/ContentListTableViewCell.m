//
//  ContentListTableViewCell.m
//  JYPProduct
//
//  Created by Apple on 2019/3/6.
//  Copyright © 2019年 JYP. All rights reserved.
//

#import "ContentListTableViewCell.h"

@implementation ContentListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



- (void)setDataSource:(NSMutableArray *)dataSource {
    
    _dataSource = dataSource;
    
    
}




@end
