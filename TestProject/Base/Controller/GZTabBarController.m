//
//  GZTabBarController.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZTabBarController.h"
#import "GZHomeController.h"
#import "GZNewController.h"
#import "GZMineViewController.h"
#import "GZCustomTabBar.h"
#import "GZContactViewController.h"
#import "GZNavigationController.h"
#import "ContextView.h"
#import "GZShowViewControlller.h"
#import "GZTabBar.h"
@interface GZTabBarController ()<GZCustomTabBarDelegate,UITabBarControllerDelegate,GHTabBarDelegate>

@end

@implementation GZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildControllers];
     [self setupTabBar];
}

 // 自定义tabBar
-(void)setupTabBar{
    for (UIView *view  in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    GZCustomTabBar *tabBar = [GZCustomTabBar instanceCustomTabBar];
     tabBar.selectDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
}
 // 添加字控制器
-(void)setupChildControllers{
    NSArray *items = @[@{@"vc_name":@"GZHomeController",
                        @"title":@"首页",
                        @"icon":@""},
                      
                      @{@"vc_name":@"GZNewController",
                        @"title":@"新闻",
                        @"icon":@""},
                       
                       @{@"vc_name":@"GZContactViewController",
                         @"title":@"社区",
                         @"icon":@""},
                       
                      @{@"vc_name":@"GZMineViewController",
                        @"title":@"我的",
                        @"icon":@""},];
    
    for (NSDictionary *dict  in items) {
        NSString *vcName = dict[@"vc_name"];
        Class  className = NSClassFromString(vcName);
        UIViewController *controller = [[className alloc] init];
        NSString *title  = dict[@"title"];
        NSString *iconName = dict[@"icon"];
        GZNavigationController *NAV= [[GZNavigationController alloc] initWithRootViewController:controller];
        [self addChildViewController:NAV titleName:title iconName:iconName];
    }
}

 // 可以单独设置item
-(void)addChildViewController:(UIViewController*)controller titleName:(NSString*)titleName iconName:(NSString*)iconName{
    
    controller.tabBarItem.title = titleName;
    controller.tabBarItem.image = [UIImage imageNamed:iconName];
    NSDictionary *normalAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *selectAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor orangeColor]};
    [controller.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:selectAttr forState:UIControlStateSelected];
    [self addChildViewController:controller];
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
       
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}

#pragma mark  -- 放大按钮点击事件
-(void)tabBarItemSelected:(NSInteger)index{
   
    GZShowViewControlller *vc = [[GZShowViewControlller alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)itemSelectAtIndex:(NSInteger)index{
    self.selectedIndex = index;
}
@end
