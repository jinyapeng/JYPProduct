//
//  KEYHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里是三方key的声明/宏定义.

#ifndef Project_KEYHeader_h
#define Project_KEYHeader_h

#define WEAK    @weakify(self);

#define STRONG  @strongify(self);

#define iOS11   @available(iOS 11.0, *)


/***************************屏幕宽高*****************************/
#define KWIDTH  CGRectGetWidth([[UIScreen mainScreen] bounds])

#define KHEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])

#define NAVBAR_HEIGHT iPhoneX ? 88 : 64


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


/***************************根据类名生成类*****************************/
#define NameToString(_name) @#_name

#define ClassName(_name)    [NSClassFromString(@#_name) new]

/***************************打印日志*****************************/

#ifdef DEBUG
# define NSLog(FORMAT, ...) printf("[%s行号:%d]:\n%s\n",__FUNCTION__,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
# define NSLog(FORMAT, ...)
#endif

/***************************ABOUT IMAGE 图片*****************************/
//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//DEFINE IMAGE      定义UIImage对象//    imgView.image = IMAGE(@"Default.png");
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//DEFINE IMAGE      定义UIImage对象
#define UIImageNamed(_pointer) [UIImage imageNamed:[NSString stringWithFormat:@"%@",_pointer]]

/***************************拼接字符串*****************************/
#define NSStringFormat(format,...)[NSString stringWithFormat:format,##__VA_ARGS__]

/***************************快捷代码块*****************************/
// Masonry 底部安全区域
#define iOS11MAS_SAFEAREALAYOUGUIDEBOTTOM \
{   \
if (iOS11) {\
make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);\
}else{\
make.bottom.equalTo(self.view.mas_bottom);\
}\
}



#endif
