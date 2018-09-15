//
//  GZCustomView.h
//  TestProject
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZCustomView : UIView
-(void)reloadViewWithData:(NSArray*)array;
@property(nonatomic,copy)void(^cellDidSelectedBlock)(NSInteger index);
@end
