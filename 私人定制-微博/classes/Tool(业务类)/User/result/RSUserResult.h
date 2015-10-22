//
//  RSUserResult.h
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSUserResult : NSObject



/**
 *  新微博未读数
 */
@property (nonatomic,assign)int status;

/**
 *  新粉丝数
 */
@property (nonatomic,assign)int follower;

/**
 *  新评论数
 */
@property (nonatomic,assign)int cmt;

/**
 *  新私信数
 */
@property (nonatomic,assign)int dm;

/**
 *  新提及我的微博数
 */
@property (nonatomic,assign)int mention_status;

/**
 *  新提及我的评论数
 */
@property (nonatomic,assign)int mention_cmt;

/**
 *  消息页的未读数
 */
@property (nonatomic ,assign) int messageCount;

/**
 *  profile页面的未读数
 */
@property (nonatomic,assign) int profileCount;

/**
 *  应用程序的未读数
 */

@property (nonatomic,assign) int totalCount;
@end
