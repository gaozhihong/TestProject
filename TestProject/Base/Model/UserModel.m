//
//  UserModel.m
//  TestProject
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
 static UserModel *_userModel;
+(instancetype)shareUserModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userModel = [[UserModel alloc] init];
    });
    return _userModel;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_userModel == nil) {
            _userModel  = [super allocWithZone:zone];
        }
    });
    return _userModel;
}
-(id)copy{
    return self;
}
-(id)mutableCopy{
    return self;
}

-(UserInfo *)readUserInfo{
   NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"user.data"];
    UserInfo *userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return userInfo;
}
-(void)saveInfo:(UserInfo *)userInfo{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"user.data"];
    [NSKeyedArchiver archiveRootObject:userInfo toFile:filePath];
}
@end
