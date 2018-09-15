//
//  GZTabBar.h
//  TestProject
//
//  Created by apple on 2018/8/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GHTabBarDelegate <NSObject>
-(void)itemSelectAtIndex:(NSInteger)index;
@end
@interface GZTabBar : UIView
+(instancetype)instanceTabBar:(NSArray*)nameArray;
@property(nonatomic,weak)id<GHTabBarDelegate>delegate;
@end
