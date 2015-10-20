//
//  RSStatusTool.h
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//   处理微博数据


#import <Foundation/Foundation.h>

@interface RSStatusTool : NSObject

/**
 *  请求更新的微博数据
 *
 *  @param sinceID 请求参数，返大于这个ID的微博
 *  @param sucess  请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)newStatusWithSinceID:(NSString *)sinceID success:(void(^)(NSArray *statuses))sucess  failure:(void(^)(NSError *error))failure;

/**
 *  请求更多旧的的微博
 *
 *  @param maxID   请求参数，返小于这个ID的微博
 *  @param sucess  请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)moreStatusWithMaxID:(NSString *)maxID success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

@end
