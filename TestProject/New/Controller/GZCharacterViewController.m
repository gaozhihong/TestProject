//
//  GZCharacterViewController.m
//  TestProject
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZCharacterViewController.h"

@interface GZCharacterViewController ()

@end

@implementation GZCharacterViewController // 人物

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    [self testView];
    [self initNavWithTitle:@"英雄"];
    [self initWithLeftBarItem];
    
}
-(void)testView{
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40,44)];
    label.center = self.view.center;
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"往事越千年，魏武挥鞭 东临碣石有遗篇";
    [self.view addSubview:label];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
