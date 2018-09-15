//
//  ContextView.m
//  TestProject
//
//  Created by apple on 2018/7/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ContextView.h"

@implementation ContextView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:1.0];
    [path setLineWidth:5.0];
    [[UIColor orangeColor] set];
    [path stroke];
}

@end
