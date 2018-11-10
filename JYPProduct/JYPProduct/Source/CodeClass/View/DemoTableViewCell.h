//
//  DemoTableViewCell.h
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseTableViewCell.h"

#define kDemoTableViewCellID       @"DemoTableViewCell"

@interface DemoTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (nonatomic,copy) NSString *copysign;


@end
