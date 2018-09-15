//
//  UIImage+Extension.m
//  TestProject
//
//  Created by apple on 2018/9/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(instancetype)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f ,1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillPath(context);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}
@end
