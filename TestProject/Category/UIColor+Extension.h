//
//  UIColor+Extension.h
//  TestProject
//
//  Created by apple on 2018/9/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+(UIColor*)gz_ColorWithHex:(uint32_t)hex;
+(UIColor*)gz_ColorWithHexStr:(NSString*)hexStr;
@end
