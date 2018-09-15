//
//  BaseViewController.h
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+VIEW.h"
@interface BaseViewController : UIViewController
@property(nonatomic,assign)BOOL isHasNetwork;
@property(nonatomic,strong)UITableView *tableView;

///设置导航条
-(void) initNavWithTitle:(NSString*)title;
-(void)initWithLeftBarItem;
-(void)initNavRightBarItem:(NSString*)title;
-(void)setNavigationBarBackground:(UIColor*)color;
 /// 没有数据提示图
-(void)showNoneDataBackground:(NSString*)defaultStr image:(NSString*)img;
-(void)removeNoneDataBackground;

 /// 无网络背景提示图
-(void)setupNoneNetworkBackground;
-(void)removeNoneNetworkBackground;

 ///弹框提示
-(void)alertHintViewWithText:(NSString*)text verticalScale:(CGFloat)verticalScale;

@end
