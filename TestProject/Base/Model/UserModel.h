//
//  UserModel.h
//  TestProject
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
@interface UserModel : NSObject
+(instancetype)shareUserModel;
-(void)saveInfo:(UserInfo*)userInfo; // 保存
-(UserInfo*)readUserInfo; // 读取数据
@end
