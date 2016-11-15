# UIBarButtonItem-Badge
Use runtime to add badge to UIBarButtonItem
![img](https://github.com/Karthus1110/UIBarButtonItem-Badge/blob/master/Badge.png)

[中文介绍](http://www.jianshu.com/p/d441b8ebf707)
# How to use ?
Just drop the “UIBarButtonItem+Badge” folder to your project,and add the code below:

    UIBarButtonItem *leftItem   = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    leftItem.hasBadge = YES;

Change the position or color just set the property in category or modify the default config of badge.

property provided:

    @property (strong, nonatomic) UIView *badge;
    @property (assign, nonatomic) UIColor *badgeColor;
    @property (assign, nonatomic) CGFloat badgeOriginX;
    @property (assign, nonatomic) CGFloat badgeOriginY;
    @property (assign, nonatomic) CGFloat badgeSize; 
    @property BOOL hasBadge;

modify the default config:

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
    
        // default config
        self.badgeColor = [UIColor redColor];
        self.badgeSize = 8;
        self.badgeOriginX = 14;
        self.badgeOriginY = 12;
        self.badge.hidden = YES;
    }

