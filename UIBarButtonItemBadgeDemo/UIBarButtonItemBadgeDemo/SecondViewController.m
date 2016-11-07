//
//  SecondViewController.m
//  UIBarButtonItemBadgeDemo
//
//  Created by zY on 16/11/7.
//  Copyright © 2016年 zY. All rights reserved.
//

#import "SecondViewController.h"
#import "UIBarButtonItem+Badge.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"usercenter_bar_item"] forState:UIControlStateNormal];
    button.frame = (CGRect){0,0,44,44};
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    leftItem.hasBadge = YES;
    leftItem.badgeOriginX = 28;
    leftItem.badgeColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
