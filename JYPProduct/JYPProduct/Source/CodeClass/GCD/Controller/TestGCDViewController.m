//
//  TestGCDViewController.m
//  JYPProduct
//
//  Created by Apple on 2020/4/20.
//  Copyright © 2020 JYP. All rights reserved.
//

#import "TestGCDViewController.h"

@interface TestGCDViewController ()

@end

@implementation TestGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /** 获取队列 **/
    
    // 获取全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 自定义 串行队列
    dispatch_queue_t queue1 = dispatch_queue_create("text", DISPATCH_QUEUE_SERIAL);
    
    // 自定义 并发队列
    dispatch_queue_t queue2 = dispatch_queue_create("test1", DISPATCH_QUEUE_CONCURRENT);
    
    // 获取主线程
    dispatch_queue_t queue3 = dispatch_get_main_queue();
    
    
    /** 提交任务 **/
    NSLog(@"1");
    // 同步
    dispatch_sync(queue, ^{
        NSLog(@"2");
    });
    
    // 异步 串行
    dispatch_async(queue1, ^{
        NSLog(@"3");
    });
    
    dispatch_sync(queue1, ^{
       NSLog(@"4");
    });
    
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
