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

/**
 *  高德地图
 */
#define AMapAPIKey @"716ad12fd28290a2fef568961ea72def"



/***************************根据类名生成类*****************************/
#define NameToString(_name) @#_name

#define ClassName(_name)    [NSClassFromString(@#_name) new]



/***************************ABOUT IMAGE 图片*****************************/

//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//DEFINE IMAGE    imgView.image = IMAGE(@"Default.png");
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//DEFINE IMAGE    定义UIImage对象
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
