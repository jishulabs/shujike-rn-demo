//
//  SjkModule.h
//  AwesomeProject
//
//  Created by kevin on 2019/4/17.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface SjkModule : NSObject <RCTBridgeModule>
+(NSDictionary *)convertDicWithJSON:(NSString *)jsonStr;
@end
