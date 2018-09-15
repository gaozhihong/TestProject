//
//  UIViewController+VIEW.h
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
 // 生成随机色

 // 获取导航
#define GZNavigator(index) ({ \
    UITabBarController *tabBar =(UITabBarController*)[UIApplication sharedApplication].keyWindow.rootViewController; \
    NSArray *controllers = tabBar.viewControllers; \
    UINavigationController *nav = nil; \
    if (index < controllers.count) {  \
       nav = controllers[index]; \
    } \
       nav; \
})
@interface UIViewController (VIEW)
 // 根据网络状态加载数据
-(void)loadDataIfHasNetwork:(void(^)(void))hasNetwork IfHasNoneNetwork:(void(^)(void))hasNoneNetwork;

 //视图内容相关
//-(void)setupNetworkBackgroundView;
-(void)removeNetworkView;

 // 弹框提示文案
-(void)alertHintViewWithText:(NSString*)text verticalScale:(CGFloat)verticalScale;

@end
