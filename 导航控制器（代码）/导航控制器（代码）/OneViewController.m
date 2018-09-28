//
//  OneViewController.m
//  导航控制器（代码）
//
//  Created by 赵鹏 on 2018/9/27.
//  Copyright © 2018年 赵鹏. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置导航栏的标题
    self.navigationItem.title = @"第一个视图控制器";
}

#pragma mark ————— 跳转页面 —————
- (IBAction)pushVC:(id)sender
{
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    
    //把新的视图控制器压入到视图控制器栈中
    [self.navigationController pushViewController:twoVC animated:YES];
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
