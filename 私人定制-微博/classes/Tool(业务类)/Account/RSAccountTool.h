//
//  RSAccountTool.h
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSAccount.h"

@interface RSAccountTool : NSObject

/**
 *  保存帐号信息
 */
+(void)saveAccount:(RSAccount *)account;

/**
 *  取出保存了的帐号
 */
+(RSAccount *)account;


+ (void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;
@end
