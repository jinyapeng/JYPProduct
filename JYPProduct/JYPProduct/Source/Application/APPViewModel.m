//
//  APPViewModel.m
//  JYPProduct
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "APPViewModel.h"

@interface APPViewModel()

@end

static APPViewModel *appView = nil;

@implementation APPViewModel

+ (instancetype)shareApp
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appView = [[APPViewModel alloc] init];
    });
    return appView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)finishLaunchOption:(NSDictionary *)option
{
    /**
     *避免在一个界面上同时点击多个UIButton导致同时响应多个方法
     */
    [[UIButton appearance] setExclusiveTouch:YES];
    
    /**
     *启动页完成后，恢复显示状态栏
     */
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    
    /**
     *设置状态栏类型（字体显示白色)
     */
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    /**
     *  默认情况下tableview header和fooer颜色的设置
     */
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        // 去掉iOS11系统默认开启的self-sizing
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
    
    
    /**
     *HUDView 设置
     */
//    [self setUpSvpProgressHud];
    
    
    
    
    /**
     *  键盘
     */
    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeDefault;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    [IQKeyboardManager sharedManager].toolbarManageBehaviour = IQAutoToolbarByPosition; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    [[IQKeyboardManager sharedManager] setShouldShowToolbarPlaceholder:YES];
    [IQKeyboardManager sharedManager].toolbarDoneBarButtonItemText = @"完成";
    [IQKeyboardManager sharedManager].toolbarTintColor = rgb(40, 40, 40, 1);
    
    /**
     *高的地图
     */
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    [AMapServices sharedServices].apiKey = AMapAPIKey;
    
    
    
    /**
     *  网络
     */
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                case -1:
                NSLog(@"未知网络");
                break;
                case 0:
                NSLog(@"网络不可用");
                break;
                case 1:
                NSLog(@"GPRS网络");
                break;
                case 2:
                NSLog(@"wifi网络");
                break;
            default:
                break;
        }
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            NSLog(@"有网");
          //  [JXUserManageCenter shareInstance].isReachableNetStatus = YES;
        }else
        {
            NSLog(@"没有网");
            [XWHUDManager showErrorTipHUD:@"当前网络不可用"];
         //   [JXUserManageCenter shareInstance].isReachableNetStatus = NO;
        }
    }];
    
    /**
     *监听网络 每三秒执行一次
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3ull * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        WEAK
//        [RACObserve([JXUserManageCenter shareInstance], isReachableNetStatus) subscribeNext:^(NSNumber*  _Nullable x) {
//            STRONG
//            if (!x.boolValue) {
//                UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                UINavigationController *navVc = [self getNavigationCWithWindow:window];
//                [JXNetWorkHudBar starMonitorWithVC:navVc.visibleViewController];
//            } else {
//                [JXNetWorkHudBar dismissHudView];
//            }
//
//        }];
    });
    
    
}



@end
