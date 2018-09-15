//
//  GZHomeModel.m
//  TestProject
//
//  Created by apple on 2018/7/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GZHomeModel.h"
@interface  GZHomeModel()
@property(nonatomic,copy)NSString *homeDataURLString;
@end
@implementation GZHomeModel
+(void)getHomePageData:(void (^)(id))successed failure:(void (^)(NSError *))failure{
    
}


#pragma mark  -- URLString
-(NSString *)homeDataURLString{
    return [NSString stringWithFormat:@"%@%@",HTTP_URLString,@"test"];
}
@end
