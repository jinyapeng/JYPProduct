//
//  HomeWaitWorkTableCell.h
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HomeWaitWorkTableCell : BaseTableViewCell

/**
 *代办内容
 */
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

/**
 *代办状态：已读、未读
 */
@property (weak, nonatomic) IBOutlet UILabel *statusLab;

/**
 *代办发布时间
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end
