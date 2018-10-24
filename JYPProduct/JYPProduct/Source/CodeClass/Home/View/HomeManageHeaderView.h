//
//  HomeManageHeaderView.h
//  JYPProduct
//
//  Created by apple on 2018/6/7.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseViewFromXib.h"

@interface HomeManageHeaderView : BaseViewFromXib

/**
 * 图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/**
 * 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

/**
 * 更多
 */
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

/**
 * 底部线条
 */
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end
