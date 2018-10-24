//
//  ToolsHeader.h
//  JYPProduct
//
//  Created by apple on 2018/6/1.
//  Copyright © 2018年 JYP. All rights reserved.
//

#ifndef ToolsHeader_h
#define ToolsHeader_h

/***************************屏幕宽高*****************************/
#define KWIDTH  CGRectGetWidth([[UIScreen mainScreen] bounds])

#define KHEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])

#define NAVBAR_HEIGHT [JYPMethodTools navigationBarHeight]

#define TABBAR_HEIGHT [JYPMethodTools tabBarHeight]

/** 首页cellItem的高度 **/
#define HOME_CELLITEM_HEIGHT 61

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone X 分辨率373x812，像素1125x2436，@3x */
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone XR 分辨率414x896，像素828x1792，@2x */
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone Xs Max 分辨率414x896，像素1125x2436，@3x */
#define iPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)


#define kiPhoneXAll ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)


/***************************系统版本*****************************/

//获取手机系统的版本
#define SystemVersionMu [[[UIDevice currentDevice] systemVersion] floatValue]

//是否为iOS7及以上系统
#define iOS7Mu ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

//是否为iOS8及以上系统
#define iOS8Mu ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

//是否为iOS9及以上系统
#define iOS9Mu ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)

//是否为iOS10及以上系统
#define iOS10Mu ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

//是否为iOS11及以上系统
#define iOS11Mu ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)



#endif /* ToolsHeader_h */
