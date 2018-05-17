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



// 屏幕宽高
#define KWIDTH  CGRectGetWidth([[UIScreen mainScreen] bounds])

#define KHEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])







#pragma mark - 快捷代码块

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
