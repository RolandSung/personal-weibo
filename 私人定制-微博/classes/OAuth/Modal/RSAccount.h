//
//  RSAccount.h
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAccount : NSObject<NSCoding>


//"access_token" = "2.00LQwiwBsk5LHCbb428ed0a8gdK66E";
//        "expires_in" = 157679999;
//        "remind_in" = 157679999;
//        uid = 1783870707;
/**
 *  获取数据的访问令牌
 */
@property (nonatomic,copy) NSString *access_token;
/**
 *  帐号有效时间
 */
@property (nonatomic,copy) NSString *expires_in;
/**
 *  帐号有效时间（即将过期）
 */
@property (nonatomic,copy) NSString *remind_in;
/**
 *  当前授权用户的UID(唯一标识)
 */
@property (nonatomic,copy) NSString *uid;

@property (nonatomic,strong)NSDate *expires_date;

+(instancetype)accountWithDictionary:(NSDictionary *)dic;


@end
