//
//  ZYTabbarController.m
//  UIBarButtonItemBadgeDemo
//
//  Created by zY on 16/11/7.
//  Copyright © 2016年 zY. All rights reserved.
//

#import "ZYTabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ZYTabbarController ()

@end

@implementation ZYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTabbarVC];
}

- (void)createTabbarVC
{
    FirstViewController *firstVC = [FirstViewController new];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"first";
    
    SecondViewController *secVC = [SecondViewController new];
    secVC.tabBarItem.title = @"second";
    UINavigationController *secNav = [[UINavigationController alloc] initWithRootViewController:secVC];
    secNav.tabBarItem.title = @"second";
    

    ThirdViewController *thirdVC = [ThirdViewController new];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    thirdNav.tabBarItem.title = @"third";
    
//    self.tabBarController.tabBar.items = @[firstItem,secItem,thirdItem];
    self.viewControllers = @[firstNav,secNav,thirdNav];
}



@end
