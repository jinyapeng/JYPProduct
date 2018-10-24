//
//  HomeNavigationView.m
//  JYPProduct
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "HomeNavigationView.h"

@interface HomeNavigationView ()

@property (nonatomic,strong)UILabel *titleLab;

@property (nonatomic,strong)UIButton *locationBtn;


@end

@implementation HomeNavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    
    self.backgroundColor = [UIColor gradientFromColor:[UIColor firstAppNavigationBarColor] toColor:[UIColor lastAppNavigationBarColor] withWidth:KWIDTH];
    
    // 标题
    self.titleLab = [CBUIKit createLabelWithTextColor:[UIColor whiteColor] fontSize:18.0];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 44));
//        make.height.mas_equalTo(44);
    }];
    
    // 定位按钮
    self.locationBtn = [CBUIKit createButtonWithTitle:@"重庆" fontSize:15.0 titleColor:[UIColor whiteColor]];
    [self.locationBtn setImage:UIImageNamed(@"Home_Location") forState:UIControlStateNormal];
    self.locationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;// 左对齐
    [self.locationBtn setImagePosition:LXMImagePositionRight spacing:8];
    [self addSubview:self.locationBtn];
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.bottom.equalTo(self.mas_bottom);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(44);
    }];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLab.text = title;
}



@end
