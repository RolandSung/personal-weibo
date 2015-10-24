//
//  RSStatus.h
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSUser.h"

@interface RSStatus : NSObject
/**
 *  被转发微博的status
 */
@property (nonatomic,strong) RSStatus *retweeted_status;
/**
 *  用户
 */
@property (nonatomic,strong) RSUser *user;

/**
 *  转发微博的name
 */
@property (nonatomic,copy) NSString *retweetName;

/**
 *  微博创建时间
 */
@property (nonatomic,copy) NSString *created_at;
/**
 *  微博信息内容
 */
@property (nonatomic,copy) NSString *text;
/**
 *  字符串型的微博ID
 */
@property (nonatomic,copy) NSString *idstr;
/**
 *  微博来源
 */
@property (nonatomic,copy) NSString *source;
/**
 *  转发数
 */
@property (nonatomic,assign) int reposts_count;
/**
 *  评论数
 */
@property (nonatomic,assign) int comments_count;
/**
 *  表态数
 */
@property (nonatomic,assign) int attitudes_count;
/**
 *  配图数组
 */
@property (nonatomic,strong) NSArray *pic_ids;
@end
