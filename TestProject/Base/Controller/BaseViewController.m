//
//  BaseViewController.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseViewController.h"
#import "Prefix.pch"
#import "AppDelegate.h"
#import "UIImage+Extension.h"
@interface BaseViewController ()

@property(nonatomic,strong)UIView *noneNetBackground;
@property(nonatomic,strong)UIRefreshControl *refreshControl;
@property(nonatomic,strong)UIView *noneDataBackground; //无数据背景图
@property(nonatomic,strong)UILabel *hintLabel;//弹框提示
@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",[self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavWithTitle:@"111"];
    
    
}


#pragma mark  -- UI
-(void)setupViews{
    [self.view addSubview:self.tableView];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor orangeColor];
    [self.refreshControl addTarget:self action:@selector(loadNewData) forControlEvents:UIControlEventValueChanged];
    NSAttributedString *attrTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    self.refreshControl.attributedTitle = attrTitle;
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = self.refreshControl;
    } else {
        // Fallback on earlier versions
    }
}
-(void)initNavWithTitle:(NSString *)title{
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0, 100, navigationBarHeight);
    
    UIButton *button = [[UIButton alloc] initWithFrame:titleView.bounds];
    button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [titleView addSubview:button];
    self.navigationItem.titleView = titleView;
    
}
-(void)initWithLeftBarItem{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundColor:[UIColor orangeColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}
-(void)initNavRightBarItem:(NSString *)title{
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 25,25);
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setBackgroundColor:[UIColor orangeColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}
 // 设置导航条背景色
-(void)setNavigationBarBackground:(UIColor*)color{
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
//    navigationBar.backgroundColor = color;
//    [navigationBar setShadowImage:[UIImage new]];
    
}
#pragma mark  -- 交互
-(void)leftBtnClick:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadNewData{
    [self.refreshControl endRefreshing];
}

//无网背景图
-(void)setupNoneNetworkBackground{
    if (!_noneNetBackground) {
//        CGRect viewFrame = CGRectMake(0, Nav_Bar_Height, SCREEN_WIDTH, SCREEN_HEIGHT-KTabBar_Height-Nav_Bar_Height);
        _noneNetBackground = [[UIView alloc] initWithFrame:self.view.bounds];
        _noneNetBackground.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_noneNetBackground];
        [self.view bringSubviewToFront:_noneNetBackground];
        
        CGFloat labWidth = SCREEN_WIDTH *0.6,labHeight = 44;
        UILabel *netLabel  = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-labWidth)/2.0,(SCREEN_HEIGHT - Nav_Bar_Height-labHeight)/2.0, labWidth, labHeight)];
        NSLog(@"%@",NSStringFromCGRect(_noneNetBackground.frame));
        
        netLabel.text = @"没有可识别的网络，请检查网络";
        netLabel.backgroundColor = [UIColor lightGrayColor];
        netLabel.textAlignment = NSTextAlignmentCenter;
        netLabel.font= [UIFont systemFontOfSize:15.0];
        [_noneNetBackground addSubview:netLabel];
    }
}
-(void)removeNoneNetworkBackground{
    _noneNetBackground.hidden  = YES;
    [_noneNetBackground removeFromSuperview];
}

 //弹框提示
-(void)alertHintViewWithText:(NSString *)text verticalScale:(CGFloat)verticalScale{
    if (_hintLabel) return;
    CGFloat fontSize = 15;
    CGSize size = [text boundingRectWithSize:CGSizeMake(0.7 *SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    CGFloat labelH = size.height + 20,labelW = size.width +20;
    CGFloat y =(SCREEN_HEIGHT -labelH)/2.0;
   _hintLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-labelW)/2.0,y ,labelW,labelH)];
   _hintLabel.font = [UIFont systemFontOfSize:fontSize];
    _hintLabel.textAlignment = NSTextAlignmentCenter;
    _hintLabel.numberOfLines = 0;
    _hintLabel.text = text;
    _hintLabel.backgroundColor =[[UIColor blackColor] colorWithAlphaComponent:0.8];
    _hintLabel.layer.cornerRadius = 5.0;
    _hintLabel.layer.masksToBounds = YES;
    _hintLabel.textColor = [UIColor gz_ColorWithHex:0xffffff];
    [self.view addSubview:_hintLabel];
    [self.view bringSubviewToFront:_hintLabel];
//    __weak typeof(_hintLabel) hintLabel_ = _hintLabel;
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
        weakSelf.hintLabel.hidden = YES;
        [weakSelf.hintLabel removeFromSuperview];
        weakSelf.hintLabel = nil;
    });
    
}
  //没有加载到数据
-(void)showNoneDataBackground:(NSString *)defaultStr image:(NSString *)img{
    if (!_noneDataBackground) {
        _noneDataBackground = [[UIView alloc] initWithFrame:self.view.bounds];
        _noneDataBackground.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_noneDataBackground];
        [self.view bringSubviewToFront:_noneDataBackground];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 24)];
        label.center = _noneDataBackground.center;
        label.textColor = [UIColor brownColor];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = defaultStr;
        [_noneDataBackground addSubview:label];
    }
    
}
-(void)removeNoneDataBackground{
    
}

#pragma mark  -- LAZY
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Nav_Bar_Height-SAFETY_AREA_HEIGHT) style:UITableViewStylePlain];
        NSLog(@"%f",Nav_Bar_Height);
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
@end
