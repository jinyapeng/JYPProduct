//
//  RegistHoisingItem.m
//  JYPProduct
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import "RegistHoisingItem.h"

#define ITEMVIEWHEIGHT 44
#define itemFont   13.0
#define itemColor        [UIColor appTextColor]
#define itemSecondColor  [UIColor appSecondTextColor]

@interface RegistHoisingItem()<UITextFieldDelegate>

@property (nonatomic)BOOL isHaveDian;

@end

@implementation RegistHoisingItem

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
   
    NSMutableArray *pointArr = [NSMutableArray arrayWithCapacity:0];
    [pointArr addObject:kLinePointSet(115, ITEMVIEWHEIGHT/4, 115, ITEMVIEWHEIGHT/4*3)];
    [DrawUtil drawLinePointArr:pointArr LineColor:[UIColor appSecondLineColor]];
}

- (RegistHoisingItem *)itemWithTitle:(NSString *)title isMust:(BOOL)isMust
{
    RegistHoisingItem *itemView = [[RegistHoisingItem alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, ITEMVIEWHEIGHT)];
    itemView.backgroundColor = [UIColor whiteColor];
    itemView.space = 10;
    [itemView setSeparatorLineType:SeparatorLineTypeCenterShortTop];
    [itemView setNeedsDisplay];
    
    /**
     * 标题
     */
    UILabel *titleLab = [CBUIKit createLabelWithTextColor:itemColor fontSize:itemFont text:title];
    [itemView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.top.bottom.equalTo(itemView);
        make.left.equalTo(itemView.mas_left).offset(15);
    }];
    
    /**
     *是否为必填项
     */
    UILabel *isMustTermLab = [CBUIKit createLabelWithTextColor:[UIColor appRedColor] fontSize:14.0];
    [itemView addSubview:isMustTermLab];
    [isMustTermLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(15);
        make.centerY.equalTo(itemView.mas_centerY);
        make.left.equalTo(titleLab.mas_right).offset(-10);
    }];
    isMustTermLab.text = isMust ? @"*" : @"";
    
    return itemView;
}



#pragma mark - 创建按钮

- (void)setName:(NSString *)name
{
    _name = name;
    
    [self.btn setTitle:name forState:UIControlStateNormal];
    [self.btn setTitleColor:itemColor forState:UIControlStateNormal];
}

- (void)setValue:(NSString *)value
{
    _value = value;
}


+ (instancetype)btnItemWithTitle:(NSString *)title isMust:(BOOL)isMust handler:(void (^)(void))handler
{
    RegistHoisingItem *itemView = [[self alloc] itemWithTitle:title isMust:isMust];
    
    /**
     *创建右侧小箭头
     */
    UIImageView *imageView = [CBUIKit createImageViewWithImage:[UIImage imageNamed:@"Bar_arrow"]];
    [itemView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(itemView.mas_centerY);
        make.right.equalTo(itemView.mas_right).offset(-10);
        make.width.mas_equalTo(7);
        make.height.mas_equalTo(12);
    }];
    
    
    /**
     *创建按钮
     */
    NSString *btnTitle = @"请选择";
    itemView.btn = [CBUIKit createButtonWithTitle:btnTitle fontSize:itemFont titleColor:itemSecondColor];
    itemView.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [itemView addSubview:itemView.btn];
    [itemView.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(itemView);
        make.right.equalTo(imageView.mas_left);
        make.left.equalTo(itemView.mas_left).offset(130);
    }];
    itemView.selectionHandler = handler;
    
    [itemView.btn addTarget:itemView action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return itemView;
}

- (void)btnAction:(UIButton *)sender
{
    self.selectionHandler();
}

#pragma mark - 创建TF

- (void)setContentType:(RegistItemTFContentType)contentType
{
    _contentType = contentType;
}

+ (instancetype)tfItemWithTitle:(NSString *)title isMust:(BOOL)isMust subtitle:(NSString *)subtitle contentType:(UIKeyboardType)contentType tfChaged:(void (^)(NSString *text))tfChaged{
    
    RegistHoisingItem *itemView = [[self alloc] itemWithTitle:title isMust:isMust];
    
    /**
     *创建右侧Lab (用于显示单位描述)
     */
    UILabel *subtitleLab = [CBUIKit createLabelWithTextColor:itemColor fontSize:itemFont text:subtitle];
    subtitleLab.textAlignment = NSTextAlignmentRight;
    [itemView addSubview:subtitleLab];
    [subtitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.top.bottom.equalTo(itemView);
        make.right.equalTo(itemView.mas_right).offset(-10);
    }];
   
    /**
     *创建 TF
     */
    title = [title stringByReplacingOccurrencesOfString:@" " withString:@""];// 去除空格
    NSString *placeholder = [NSString stringWithFormat:@"请输入%@",title];
    itemView.TF = [CBUIKit createTextFieldWithPlaceholder:placeholder textColor:itemColor fontSize:itemFont];
    [itemView addSubview:itemView.TF];
    [itemView.TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(itemView);
        make.right.equalTo(subtitleLab.mas_left);
        make.left.equalTo(itemView.mas_left).offset(130);
    }];
    itemView.TF.delegate = itemView;
    itemView.tfContentChaged = tfChaged;
    itemView.TF.keyboardType = contentType;
    [itemView.TF addTarget:itemView action:@selector(tfContentChagedAction:) forControlEvents:UIControlEventEditingChanged];
    
    return itemView;
}

- (void)tfContentChagedAction:(UITextField *)textField
{
    self.tfContentChaged(textField.text);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /*
     * 不能输入.0-9以外的字符。
     * 设置输入框输入的内容格式
     * 只能有一个小数点
     * 小数点后最多能输入两位
     * 如果第一位是.则前面加上0.
     * 如果第一位是0则后面必须输入点，否则不能输入。
     */
    
    if (self.contentType != TFContentTypeFloatNumber) {
        return YES;
    }
    
    // 判断是否有小数点
    if ([textField.text containsString:@"."]){
        self.isHaveDian = YES;
    }else{
        self.isHaveDian = NO;
    }
    
    if (string.length > 0) {
        //当前输入的字符
        unichar single = [string characterAtIndex:0];
        DLog(@"single = %c",single);
        // 不能输入.0-9以外的字符
        if (!((single >= '0' && single <= '9') || single == '.')){
            return NO;
        }
        // 只能有一个小数点
        if (self.isHaveDian && single == '.') {
            return NO;
        }
        
        // 如果第一位是.则前面加上0.
        if ((textField.text.length == 0) && (single == '.')){
            textField.text = @"0";
            
        }
        
        // 如果第一位是0则后面必须输入点，否则不能输入。
        if ([textField.text hasPrefix:@"0"]){
            if (textField.text.length > 1){
                NSString *secondStr = [textField.text substringWithRange:NSMakeRange(1, 1)];
                if (![secondStr isEqualToString:@"."]){
                    return NO;
                }
                
            }else{
                if (![string isEqualToString:@"."]){
                    return NO;
                }
            }
        }
        // 小数点后最多能输入两位
        if (self.isHaveDian) {
            NSRange ran = [textField.text rangeOfString:@"."];
            // 由于range.location是NSUInteger类型的，所以这里不能通过(range.location - ran.location)>2来判断
            if (range.location > ran.location) {
                if ([textField.text pathExtension].length > 1) {
                    return NO;
                    
                }
            }
        }
    }
    return YES;
}



@end
