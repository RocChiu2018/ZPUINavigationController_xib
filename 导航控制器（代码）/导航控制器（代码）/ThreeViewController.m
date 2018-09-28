//
//  ThreeViewController.m
//  导航控制器（代码）
//
//  Created by 赵鹏 on 2018/9/27.
//  Copyright © 2018年 赵鹏. All rights reserved.
//

#import "ThreeViewController.h"
#import "OneViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"第三个视图控制器";
    
    //设置导航栏上的按钮数组
    UIBarButtonItem *navBtn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(clickNavBtn:)];
    UIBarButtonItem *navBtn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickNavBtn:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:navBtn1, navBtn2, nil];
}

#pragma mark ————— 点击导航栏上的按钮 —————
- (void)clickNavBtn:(id)sender
{
    NSLog(@"您点击了导航栏上的按钮");
}

#pragma mark ————— 返回上个页面 —————
- (IBAction)goBack:(id)sender
{
    /**
     显示在屏幕上的永远是导航控制器栈的栈顶控制器的view；
     调用popViewControllerAnimated方法之后系统会移除栈顶控制器，移除的那个栈顶控制器随之会被销毁，所以它的view也就随之而消失了。
     */
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ————— 返回根视图控制器 —————
- (IBAction)popToRootVC:(id)sender
{
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    /**
     也可以不用上面的方法返回到导航控制器栈的栈底控制器，而是先利用导航控制器栈的视图控制器数组属性来获取栈底控制器，再利用其它方法跳回到这个栈底控制器。
     */
    OneViewController *oneVC = [self.navigationController.childViewControllers firstObject];
    [self.navigationController popToViewController:oneVC animated:YES];
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
