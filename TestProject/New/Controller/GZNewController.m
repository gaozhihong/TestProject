//
//  GZNewController.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZNewController.h"
#import "GZCustomView.h"
#import "GZCharacterViewController.h"
@interface GZNewController ()
@property(nonatomic,strong)GZCustomView *customView;
@end

@implementation GZNewController{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self alertHintViewWithText:@"欢迎访问APP" verticalScale:0.5];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initNavWithTitle:@"新闻"];
    [self setupViews];
    [self prepareData];
    [self setNavigationBarBackground:[UIColor cyanColor]];
    [self showNoneDataBackground:@"没有加载到数据" image:@""];
    

}

-(void)setupViews{
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    v.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:v];
    self.customView = [[GZCustomView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.customView];
//    self.customView.backgroundColor = [UIColor lightGrayColor];
    __weak typeof(self) weakSelf = self;
      GZCharacterViewController *characterVC =[GZCharacterViewController new];
    self.customView.cellDidSelectedBlock = ^(NSInteger index) {
      
        [weakSelf.navigationController pushViewController:characterVC animated:YES];
        
    };
}
-(void)prepareData{
    NSArray *arr = @[@"曹操",@"刘备",@"周瑜",@"曹操",@"刘备",@"周瑜",@"曹操",@"刘备",@"周瑜",@"曹操",@"刘备",@"周瑜",@"曹操",@"刘备",@"周瑜",@"曹操",@"刘备",@"周瑜"];
    [self.customView reloadViewWithData:arr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
