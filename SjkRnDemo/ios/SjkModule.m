//
//  SjkModule.m
//  AwesomeProject
//
//  Created by kevin on 2019/4/17.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "SjkModule.h"
#import "SjkAgent.h"
@implementation SjkModule

// To export a module named CalendarManager
RCT_EXPORT_MODULE();

// This would name the module AwesomeCalendarManager instead
// RCT_EXPORT_MODULE(AwesomeCalendarManager);


//JSON转字典
+(NSDictionary *)convertDicWithJSON:(NSString *)jsonStr {
  if (jsonStr.length == 0) {
    return nil;
  }
  NSError *err;
  NSData *jsondata = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&err];
  if (err) {
    return nil;
  }

  return dic;

}
RCT_EXPORT_METHOD(setAttribute:(NSString *)attrJson)
{
  [SjkAgent setAttributeDict:[SjkModule convertDicWithJSON:attrJson]];
}

RCT_EXPORT_METHOD(postEvent:(NSString *)eventType :(NSString *)eventAttrJson)
{
  [SjkAgent postEventevent:eventType dict:[SjkModule convertDicWithJSON:eventAttrJson]];
}

RCT_EXPORT_METHOD(bindUserInfo:(NSString *)userInfoJson)
{
  
  NSDictionary *userInfoDic = [SjkModule convertDicWithJSON:userInfoJson];
  //设置用户信息
  UserBean *userBean = [[UserBean alloc]init];
  userBean.userId = [userInfoDic objectForKey:@"userId"];
  userBean.userRegesterChannel = [userInfoDic objectForKey:@"userRegisterChannel"];
  userBean.userGender = [userInfoDic objectForKey:@"userSex"];
  userBean.userAge = [userInfoDic objectForKey:@"userAge"];
  userBean.userType = [userInfoDic objectForKey:@"userType"];
  userBean.userLevel = [userInfoDic objectForKey:@"userLevel"];
  userBean.userProvince = [userInfoDic objectForKey:@"userProvince"];
  userBean.userCity = [userInfoDic objectForKey:@"userCity"];
 
  [SjkAgent bindUserInfo:userBean];
}



@end
