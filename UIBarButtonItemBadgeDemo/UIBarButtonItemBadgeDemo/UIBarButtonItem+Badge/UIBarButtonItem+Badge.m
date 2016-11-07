//
//  ZYTabbarController.h
//  UIBarButtonItem+Badge.m
//
//  Created by zY on 16/11/7.
//  Copyright © 2016年 zY. All rights reserved.
//

#import "UIBarButtonItem+Badge.h"
#import <objc/runtime.h>

NSString *const ZYBarButtonItem_hasBadgeKey = @"ZYBarButtonItem_hasBadgeKey";
NSString *const ZYBarButtonItem_badgeKey = @"ZYBarButtonItem_badgeKey";
NSString *const ZYBarButtonItem_badgeSizeKey = @"ZYBarButtonItem_badgeSizeKey";
NSString *const ZYBarButtonItem_badgeOriginXKey = @"ZYBarButtonItem_badgeOriginXKey";
NSString *const ZYBarButtonItem_badgeOriginYKey = @"ZYBarButtonItem_badgeOriginYKey";
NSString *const ZYBarButtonItem_badgeColorKey = @"ZYBarButtonItem_badgeColorKey";


@implementation UIBarButtonItem (Badge)
@dynamic hasBadge;
@dynamic badgeSize,badgeOriginX,badgeOriginY;


- (void)initBadge
{
    UIView *superview = nil;
    
    if (self.customView) {
        superview = self.customView;
        superview.clipsToBounds = NO;
    } else if ([self respondsToSelector:@selector(view)] && [(id)self view]) {
        superview = [(id)self view];
    }
    [superview addSubview:self.badge];
    
    // 默认设置 default configure 
    self.badgeColor = [UIColor redColor];
    self.badgeSize = 8;
    self.badgeOriginX = 14;
    self.badgeOriginY = 12;
    self.badge.hidden = YES;
}

- (void)showBadge
{
    self.badge.hidden = NO;
}

- (void)hideBadge
{
    self.badge.hidden = YES;
}

- (void)refreshBadge
{
    self.badge.frame = (CGRect){self.badgeOriginX,self.badgeOriginY,self.badgeSize,self.badgeSize};
    self.badge.backgroundColor = self.badgeColor;
    self.badge.layer.cornerRadius = self.badgeSize/2;
}


#pragma mark ---------- badge getter & setter function -----------

- (UIView *)badge
{
    UIView *badge = (UIView *)objc_getAssociatedObject(self, &ZYBarButtonItem_badgeKey);
    if (!badge) {
        badge = [[UIView alloc] init];
        [self setBadge:badge];
        [self initBadge];
    }
    return badge;
}

- (void)setBadge:(UIView *)badge
{
    objc_setAssociatedObject(self, &ZYBarButtonItem_badgeKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)badgeColor
{
    return objc_getAssociatedObject(self, &ZYBarButtonItem_badgeColorKey);
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
    objc_setAssociatedObject(self, &ZYBarButtonItem_badgeColorKey, badgeColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

-(CGFloat)badgeSize {
    NSNumber *number = objc_getAssociatedObject(self, &ZYBarButtonItem_badgeSizeKey);
    return number.floatValue;
}

-(void)setBadgeSize:(CGFloat)badgeSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeSize];
    objc_setAssociatedObject(self, &ZYBarButtonItem_badgeSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

-(CGFloat)badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &ZYBarButtonItem_badgeOriginXKey);
    return number.floatValue;
}

-(void)setBadgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &ZYBarButtonItem_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

-(CGFloat)badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &ZYBarButtonItem_badgeOriginYKey);
    return number.floatValue;
}

-(void)setBadgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &ZYBarButtonItem_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

- (void)setHasBadge:(BOOL)hasBadge
{
    if (hasBadge) {
        [self showBadge];
    }else{
        [self hideBadge];
    }
    
    NSNumber *number = [NSNumber numberWithBool:hasBadge];
    objc_setAssociatedObject(self, &ZYBarButtonItem_hasBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hasBadge
{
    NSNumber *number = objc_getAssociatedObject(self, &ZYBarButtonItem_hasBadgeKey);
    return number.boolValue;
}

@end
