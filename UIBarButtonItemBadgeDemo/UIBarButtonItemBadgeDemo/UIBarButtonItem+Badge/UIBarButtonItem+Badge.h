//
//  ZYTabbarController.h
//  UIBarButtonItem+Badge.h
//
//  Created by zY on 16/11/7.
//  Copyright © 2016年 zY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Badge)
@property (strong, nonatomic) UIView *badge;
@property (assign, nonatomic) UIColor *badgeColor;
@property (assign, nonatomic) CGFloat badgeOriginX;
@property (assign, nonatomic) CGFloat badgeOriginY;
@property (assign, nonatomic) CGFloat badgeSize; // badge width and height
@property BOOL hasBadge; // show badge or not
@end
