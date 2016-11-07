//
//  FirstViewController.m
//  UIBarButtonItemBadgeDemo
//
//  Created by zY on 16/11/7.
//  Copyright © 2016年 zY. All rights reserved.
//

#import "FirstViewController.h"
#import "UIBarButtonItem+Badge.h"
#import "ThirdViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"usercenter_bar_item"] forState:UIControlStateNormal];
    button.frame = (CGRect){0,0,44,44};
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // use default config
    leftItem.hasBadge = YES;
    
}


@end
