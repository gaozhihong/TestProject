//
//  GZTabBar.m
//  TestProject
//
//  Created by apple on 2018/8/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZTabBar.h"
#import "UIViewController+VIEW.h"
@interface  GZTabBar()
@property(nonatomic,assign)NSInteger itemCount;
@property(nonatomic,strong)UIView *centerView;
@end
@implementation GZTabBar
+(instancetype)instanceTabBar:(NSArray *)nameArray{
    GZTabBar *tabBar =[[GZTabBar alloc] init];
    NSInteger tag = 0;
    for (NSString *name in nameArray) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:name forState:UIControlStateNormal];
        [button setBackgroundColor: KRandom_color];
           button.tag = tag;
        button.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [button addTarget:self action:@selector(buttonItemClick:) forControlEvents:UIControlEventTouchUpOutside];
        [tabBar addSubview:button];
        tag ++;
    }
    return tabBar;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    int i =  0;
    CGFloat itemW = [UIScreen mainScreen].bounds.size.width / 5;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            if (i == 2) {
                i = 3;
            }
            view.frame = CGRectMake(i * itemW, 2, itemW, self.frame.size.height);
        }
        i++;
    }
    UIButton *centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, itemW *0.8, 50)];
    centerButton.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2 -5);
    centerButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:centerButton];
}
-(void)buttonItemClick:(UIButton*)button{
    
    if ([self.delegate respondsToSelector:@selector(itemSelectAtIndex:)]) {
        [self.delegate itemSelectAtIndex:button.tag];
    }
}
@end
