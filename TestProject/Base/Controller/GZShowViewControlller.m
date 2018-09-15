//
//  GZShowViewControlller.m
//  TestProject
//
//  Created by apple on 2018/7/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZShowViewControlller.h"
#import "ContextView.h"
@interface GZShowViewControlller ()

@end

@implementation GZShowViewControlller
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor =[UIColor whiteColor];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     ContextView *textView  =[[ContextView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    textView.center = self.view.center ;
    [self.view addSubview:textView];
    [self setupNoneNetworkBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
