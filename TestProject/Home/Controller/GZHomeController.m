//
//  GZHomeController.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZHomeController.h"
#import "DestnationViewController.h"
#import "UIViewController+VIEW.h"
#import "UserModel.h"
#import "GZHomeModel.h"
@interface GZHomeController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)NSArray *dataList;
@end

@implementation GZHomeController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
     // 技术的瑕疵 独立开发的结果
      // 可以吗 没事情的
     // 写在父类里面
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHomePageUI];
    self.view.backgroundColor = [UIColor whiteColor];

    [self requestData];

    [self initNavWithTitle:@"首页"];
    [self initNavRightBarItem:@"设置"];
    [self alertHintViewWithText:@"欢迎来到app" verticalScale:0.5];
//    [self setupNoneNetworkBackground];
}
-(void)setupHomePageUI{
    [self.view addSubview:self.mainTableView];
}

#pragma mark  -- 请求数据
-(void)requestData{
    [self loadDataIfHasNetwork:^{
        [self loadAllData] ;
    } IfHasNoneNetwork:^{
        
    }];
    
    self.dataList = @[@"曹操 魏武挥鞭，东临碣石有遗篇",
                      @"刘备 人中之龙 天下枭雄也",
                      @"孙权 江东之猛虎也",
                      @"诸葛亮 鞠躬尽瘁 死而后已"].copy;
    
}

-(void)loadAllData{
    
    [GZHomeModel getHomePageData:^(id responseObj) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self alertHintViewWithText:@"提示" verticalScale:0.5];
}
#pragma mark  -- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataList[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.textLabel.textAlignment= NSTextAlignmentCenter;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"h == %ld",(long)indexPath.row);// 调用一一对应的关系
    return 64;
}
#pragma mark  -- lazy
-(UITableView *)mainTableView{
    if (_mainTableView == nil) {
//        CGRect tabFrame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.delegate =self ;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
    }
    return _mainTableView;
}
@end
