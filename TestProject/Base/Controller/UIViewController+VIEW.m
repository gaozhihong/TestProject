//
//  UIViewController+VIEW.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIViewController+VIEW.h"
#import <AFNetworking.h>
#import <objc/runtime.h>
@implementation UIViewController (VIEW)

-(void)loadDataIfHasNetwork:(void (^)(void))hasNetwork IfHasNoneNetwork:(void (^)(void ))hasNoneNetwork{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld",(long)status);
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                hasNetwork();
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                hasNetwork();
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                hasNoneNetwork();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                hasNoneNetwork();
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}
-(void)setupNetworkBackgroundView{
    
    UIView *backView = objc_getAssociatedObject(self, "back_view");
    if (backView) return;
    backView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backView.backgroundColor = [UIColor lightGrayColor];
    objc_setAssociatedObject(self, "back_view", backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.view addSubview:backView];
    [self.view insertSubview:backView atIndex:0];
    
    UILabel *introductLabel  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 44)];
    introductLabel.center = backView.center;
    introductLabel.font = [UIFont systemFontOfSize:15.0];
    introductLabel.textAlignment  = NSTextAlignmentCenter;
    introductLabel.text = @"未检测到网络";
    [backView addSubview:introductLabel];
    
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapMethod:)];
    introductLabel.userInteractionEnabled = YES;
    [introductLabel addGestureRecognizer:labelTap];
}
-(void)removeNetworkView{
    UIView *getView =objc_getAssociatedObject(self, "back_view");
    getView.hidden = YES;
    [getView removeFromSuperview];
    getView = nil;
}
-(void)labelTapMethod:(UITapGestureRecognizer*)ges{
    [self removeNetworkView];
}

 // 弹框提示
-(void)alertHintViewWithText:(NSString *)text verticalScale:(CGFloat)verticalScale{
     CGFloat fontSize = 15.0;
     CGSize labSize  = [text boundingRectWithSize:CGSizeMake(0.7 *SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
     CGFloat labelW = labSize.width+20,labelH = labSize.height+20;
       UILabel *hintLabel = objc_getAssociatedObject(self, "alert_view");
    if (hintLabel == nil) {
        hintLabel = [[UILabel alloc] init];
        objc_setAssociatedObject(self, "alert_view", hintLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        hintLabel.backgroundColor = [UIColor blackColor];
        hintLabel.alpha = 0.8;
        hintLabel.numberOfLines = 0;
        hintLabel.font = [UIFont systemFontOfSize:fontSize];
        hintLabel.textAlignment = NSTextAlignmentCenter;
        hintLabel.textColor = [UIColor whiteColor];
        hintLabel.text = text;
        hintLabel.layer.cornerRadius  = 5.0;
        hintLabel.layer.masksToBounds = YES;
        hintLabel.frame = CGRectMake((self.view.frame.size.width -labelW)/2.0, (SCREEN_HEIGHT -labelH)/2.0, labelW,labelH);
        [self.view addSubview:hintLabel];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hintLabel.hidden = YES;
            [hintLabel removeFromSuperview];
            return;
        });
    }
    
    if (hintLabel.hidden == YES) {
        hintLabel.hidden = NO;
        hintLabel.text = text;
        hintLabel.frame = CGRectMake((self.view.frame.size.width -labelW)/2.0, (SCREEN_HEIGHT -labelH)/2.0, labelW,labelH);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hintLabel.hidden = YES;
        });
    }
}
@end
