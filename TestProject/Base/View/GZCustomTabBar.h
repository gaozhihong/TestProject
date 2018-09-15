//
//  GZCustomTabBar.h
//  TestProject
//
//  Created by apple on 2018/7/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZCustomTabBarDelegate <NSObject>
@optional
-(void)tabBarItemSelected:(NSInteger)index;
@end
@interface GZCustomTabBar : UITabBar
+(instancetype)instanceCustomTabBar;
@property(nonatomic,weak) id<GZCustomTabBarDelegate> selectDelegate;
@end
