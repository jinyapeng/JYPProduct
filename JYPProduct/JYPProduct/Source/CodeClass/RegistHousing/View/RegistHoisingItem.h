//
//  RegistHoisingItem.h
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "BaseViewFromXib.h"

typedef NS_ENUM(NSInteger ,RegistItemTFContentType) {
    
    TFContentTypeNone,        //    无特别限制，随意输入
    TFContentTypePhoneNumber, //    只可输入纯数字
    TFContentTypeFloatNumber, //    可输入带小数点的纯数字
};


@interface RegistHoisingItem : BaseViewFromXib


#pragma mark - 创建输入框

@property (nonatomic,strong)UITextField *TF;

/**
 *输入框内容为float类型
 */
@property (nonatomic,assign)RegistItemTFContentType contentType;

/**
 * 输入框监听回调
 */
@property (nonatomic, copy) void (^tfContentChaged)(NSString *);

/**
 *快速创建 带textField的 方法
 */
+ (instancetype)tfItemWithTitle:(NSString *)title isMust:(BOOL)isMust
                       subtitle:(NSString *)subtitle
                    contentType:(UIKeyboardType)contentType
                       tfChaged:(void (^)(NSString *text))tfChaged;




#pragma mark - 创建按钮方法
/**
 *按钮上展示的内容
 */
@property (nonatomic,copy)NSString *name;

/**
 * name 对应的 值
 */
@property (nonatomic,copy)NSString *value;


@property (nonatomic,strong)UIButton *btn;

/**
 * 点击后的事件处理
 */
@property (nonatomic, copy) void (^selectionHandler)(void);

/**
 *按钮行创建 方法
 */
+ (instancetype)btnItemWithTitle:(NSString *)title isMust:(BOOL)isMust handler:(void (^)(void))handler;




@end
