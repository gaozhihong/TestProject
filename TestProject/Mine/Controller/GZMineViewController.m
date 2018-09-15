//
//  GZMineViewController.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZMineViewController.h"

@interface GZMineViewController ()

@end

@implementation GZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KRandom_color;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
     //设置导航背景颜色
    [self setNavigationBarBackground:[UIColor brownColor]];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Nav_Bar_Height-SAFETY_AREA_HEIGHT)];
    v.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:v];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
