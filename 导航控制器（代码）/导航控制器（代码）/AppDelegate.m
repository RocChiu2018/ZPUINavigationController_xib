//
//  AppDelegate.m
//  导航控制器（代码）
//
//  Created by 赵鹏 on 2018/9/27.
//  Copyright © 2018年 赵鹏. All rights reserved.
//

/**
 这个Demo无storyboard文件，在项目的TARGETS中的General中的Deployment Info中的Main Interface后面填空，代表不用storyboard文件。
 
 可以用如下的属性来获取导航控制器里面的视图控制器数组：
 nav.viewControllers
 nav.childViewControllers
 
 可以用如下的属性来获取导航控制器里面的栈顶控制器：
 nav.topViewController
 
 UINavigationController内部组件的用法：
 1、UINavigationBar：专门指导航栏，可以使用这个类设置导航栏的一些属性，比如导航栏的背景图片、导航栏的背景颜色等；
 2、UINavigationItem：导航栏上用于管理导航项的类，是导航栏中管理的一个项目的抽象，可以利用本类设置导航栏中间的标题(title)、导航栏中间的视图(titleView)、导航栏左边的返回按钮的标题(backBarButtonItem)；
 3、UIBarButtonItem：一个UINavigationItem中，还可以包含许多BarButtonItem，BarButtonItem是一系列的按钮，会出现在导航栏的左侧或右侧。
 */
#import "AppDelegate.h"
#import "OneViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1、创建程序的窗口：
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //利用xib文件来创建视图控制器
    OneViewController *oneVC = [[OneViewController alloc] initWithNibName:@"OneViewController" bundle:[NSBundle mainBundle]];
    
    /**
     创建导航控制器方法1：
     直接设置导航栏控制器的根视图控制器（栈底控制器）。
     */
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oneVC];
    
    /**
     创建导航栏控制器方法2：
     先创建再设置它的根视图控制器（栈底控制器）。
     */
    UINavigationController *nav = [[UINavigationController alloc] init];
    [nav addChildViewController:oneVC];
//    [nav pushViewController:oneVC animated:YES];  //这句代码与上一句代码的作用相同
    
    //2、设置窗口的根视图控制器：
    self.window.rootViewController = nav;
    
    //3、设置window为主窗口并显示出来：
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
