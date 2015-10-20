//
//  RSAccountParam.h
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAccountParam : NSObject

/**
*  AppKey
*/
@property (nonatomic, copy) NSString *client_id;
/**
 *  AppSecret
 */
@property (nonatomic, copy) NSString *client_secret;
/**
 *  请求的类型,填写authorization_code
 */
@property (nonatomic, copy) NSString *grant_type;
/**
 *  调用authorize获得的code值
 */
@property (nonatomic, copy) NSString *code;
/**
 *  回调地址
 */
@property (nonatomic, copy) NSString *redirect_uri;



@end
