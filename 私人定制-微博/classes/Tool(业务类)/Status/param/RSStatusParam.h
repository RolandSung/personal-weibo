//
//  RSStatusParam.h
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//  参数模型

#import <Foundation/Foundation.h>

@interface RSStatusParam : NSObject



/**
 *  采用OAuth授权方式为必填参数
 */
@property (nonatomic,copy) NSString *access_token;

/**
 *  指定此参数，则返回ID比since_id大的微博
 */
@property (nonatomic,copy) NSString *since_id;

/**
 *  指定此参数，则返回ID小于或等于max_id的微博
 */
@property (nonatomic,copy) NSString *max_id;

@end
