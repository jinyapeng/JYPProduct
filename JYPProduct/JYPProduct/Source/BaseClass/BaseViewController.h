//
//  BaseViewController.h
//  JYPProduct
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 JYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)hideKeyboardTapGesture;

- (void)setupRefreshFortableView:(UITableView *)tableView WithAction:(SEL)headerRereshing and:(SEL)footderReReshing;

@end
