//
//  RegistHousingVController.m
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "RegistHousingVController.h"
#import "RegistHousingView.h"

@interface RegistHousingVController ()

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)RegistHousingView *registHouseView;


@end

@implementation RegistHousingVController

- (void)viewWillAppear:(BOOL)animated
{
    [[IQKeyboardManager sharedManager] setEnable:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [[IQKeyboardManager sharedManager] setEnable:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUIView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initUIView
{
    self.navigationItem.title = @"登记房源";
    [self addRightBarButtonItemWithTitle:@"保存" action:@selector(saveBtnAction)];
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor appBackGroundColor];
    [self.view addSubview:_scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        iOS11MAS_SAFEAREALAYOUGUIDEBOTTOM
        make.top.left.right.equalTo(self.view);
    }];
    
    self.registHouseView = [[RegistHousingView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 1000)];
    [self.scrollView addSubview:_registHouseView];
//    [self.registHouseView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.scrollView);
//        make.height.mas_equalTo(1000);
//        [self.registHouseView layoutIfNeeded];
//    }];
    
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.registHouseView.mas_bottom).offset(10);
//    }];
//    
    self.scrollView.contentSize = CGSizeMake(KWIDTH, self.registHouseView.height);
    
    
    
    
}

- (void)saveBtnAction
{
    
}

@end
