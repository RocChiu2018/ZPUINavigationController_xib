//
//  TwoViewController.m
//  导航控制器（代码）
//
//  Created by 赵鹏 on 2018/9/27.
//  Copyright © 2018年 赵鹏. All rights reserved.
//

/**
 共有四种创建UIBarButtonItem按钮的方法，分别是：
 1、initWithTitle: style: target: action:
 2、initWithImage: style: target: action:
 3、initWithCustomView:
 4、initWithBarButtonSystemItem: target: action:
 */
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置导航栏的中间视图
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    //设置下一个页面中导航栏上的返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //设置导航栏上的带文字的按钮
    UIBarButtonItem *navTextBtn = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
    self.navigationItem.leftBarButtonItem = navTextBtn;
    
    /**
     设置导航栏上带图片的按钮：
     iOS7以后导航栏上的不管是文字按钮还是图片按钮，系统都会默认把它渲染成蓝色的，如果图片按钮想显示原图而不想让系统把它渲染成蓝色的话有两种方法：
     1、在项目的Assets.xcassets文件中选中相应的图片，然后在实用工具区(utilities area)中的Image Set中的Render As中选择Original Image就可以了；
     2、用代码的方式：图片对象调用imageWithRenderingMode:方法来达到目的。
     */
    UIImage *image = [UIImage imageNamed:@"navigationbar_friendsearch"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *navImageBtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = navImageBtn;
    
    /**
     如果想设置导航栏上的图片按钮在高亮状态下的背景图片的话就不能用上面的系统方法生成的UIBarButtonItemad对象了，而是要自己创建按钮。
     */
    UIButton *navImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [navImageButton setImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    [navImageButton setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
//    navImageButton.frame = CGRectMake(100, 100, 35, 35);  //代码只能控制导航栏上的按钮的尺寸而不能控制其位置
    [navImageButton sizeToFit];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navImageButton];
}

#pragma mark ————— 跳转页面 —————
- (IBAction)pushVC:(id)sender
{
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:threeVC animated:YES];
}

#pragma mark ————— 返回上个页面 —————
- (void)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
