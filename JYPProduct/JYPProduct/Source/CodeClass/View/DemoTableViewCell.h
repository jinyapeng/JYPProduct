//
//  DemoTableViewCell.h
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseTableViewCell.h"

#define DemoTableViewCellID @"DemoTableViewCell"

@interface DemoTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end
