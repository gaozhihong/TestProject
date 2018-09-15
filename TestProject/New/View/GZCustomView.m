//
//  GZCustomView.m
//  TestProject
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZCustomView.h"
@interface  GZCustomView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *listArray;
@property(nonatomic,strong) UIView *headerView;
@end
@implementation GZCustomView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupbSubviews];
    }
    return self;
}
-(void)setupbSubviews{
    [self addSubview:self.tableView];
    self.headerView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH *3/4.0);
    self.tableView.tableHeaderView = self.headerView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-KTabBar_Height);
//    NSLog(@"%d --%f",IS_IphoneX,KNavigationBar_Height);
    self.tableView.frame = self.bounds;
   
}
-(void)reloadViewWithData:(NSArray *)array{
    self.listArray = array;
    [self.tableView reloadData];
}

#pragma mark   -- UITableView  delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.listArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellDidSelectedBlock) {
        self.cellDidSelectedBlock(indexPath.row);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
#pragma mark  -- Lazy
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}
-(UIView *)headerView{
    if (_headerView == nil) {
        _headerView = [[UIView alloc] init];
    }
    return _headerView;
}
@end
