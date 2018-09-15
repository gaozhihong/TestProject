//
//  GZHomeModel.h
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZHomeModel : NSObject
+(void)getHomePageData:(void(^)(id responseObj))successed failure:(void(^)(NSError * error))failure;
@end
