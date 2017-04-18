//
//  AppDelegate.m
//  ZYLeadingPage
//
//  Created by 胡正康 on 2017/4/17.
//  Copyright © 2017年 ZY_kang. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYLeadingPageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //第一次打开APP 进入引导页
    ZYLeadingPageController  * leadingPageController = [[ZYLeadingPageController alloc]initWithPageCount:5 setUpCellHander:^(ZYLeadingPageCell *cell, NSIndexPath *indexPath) {
        //设置图片
        NSString  * imageName = [NSString stringWithFormat:@"wangyiyun%ld",indexPath.row];
        [cell.imageView setImage:[UIImage imageNamed:imageName]];
        
        //设置按钮
        [cell.finishBtn setTitle:@"我来看看" forState:normal];
        [cell.finishBtn setTitleColor:[UIColor redColor] forState:normal];
    } finishHandler:^(UIButton *finishBtn) {
        NSLog(@"-----------------点击了完成按钮");
    }];
    //自定义属性
    leadingPageController.pageControl.pageIndicatorTintColor = [UIColor redColor];
    leadingPageController.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = leadingPageController;
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
