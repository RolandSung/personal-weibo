//
//  RSHttpTool.h
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//  处理网络请求


#import <Foundation/Foundation.h>

@interface RSHttpTool : NSObject

/**
 *  发送get请求
 *
 *  @param urlString  请求的基本url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)urlString
            parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;



/**
 *  发送POST请求
 *
 *  @param urlString  请求的基本url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)urlString parameters:(id)parameters success:(void(^)(id responseObject ))success failure:(void(^)(NSError *error))failure;

@end
