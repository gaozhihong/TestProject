//
//  GZCustomTabBar.m
//  TestProject
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZCustomTabBar.h"
#import "UIViewController+VIEW.h"
@interface  GZCustomTabBar()
@property(nonatomic,strong)UIView *separateLine;
@property(nonatomic,strong)UIButton *centerButton;
@end

@implementation GZCustomTabBar
+(instancetype)instanceCustomTabBar{
    GZCustomTabBar *tabBar = [[GZCustomTabBar alloc] init];
    [tabBar addSubview:tabBar.centerButton];
    tabBar.backgroundColor = [UIColor whiteColor];
//    [tabBar addSubview:tabBar.separateLine];
    return tabBar;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / 5.0;
    for (UIView *view in self.subviews) {
         if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]){
           NSInteger indexFromOriginx = view.frame.origin.x / width;
           if (indexFromOriginx >= 2) {
                indexFromOriginx++;
            }
            CGFloat x = indexFromOriginx *width;
            view.frame = CGRectMake(x, 0, width, self.frame.size.height-SAFETY_AREA_HEIGHT); // toolBar高度减去底部间距(iphoneX)
         }else if (view  == self.centerButton) {
                 view.frame = CGRectMake(0, -10, 0.8*width, self.frame.size.height-SAFETY_AREA_HEIGHT);
                 view.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0-5);
         }

    }
}

-(void)centerButtonClick:(UIButton*)sender{
    if ([self.selectDelegate respondsToSelector:@selector(tabBarItemSelected:)]) {
        [self.selectDelegate tabBarItemSelected:0];
    }
}
#pragma mark  -- lazy
-(UIButton *)centerButton{
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _centerButton.backgroundColor = [UIColor orangeColor];
        [_centerButton addTarget:self action:@selector(centerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}
-(UIView *)separateLine{
    if (_separateLine == nil) {
        _separateLine = [[UIView alloc] init];
        _separateLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _separateLine;
}
@end
