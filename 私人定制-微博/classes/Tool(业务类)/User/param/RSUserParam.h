//
//  RSUserParam.h
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSBaseParem.h"

@interface RSUserParam : RSBaseParem

/**
 *  需要获取消息未读数的用户UID，必须是当前登录用户。
 */

@property (nonatomic,copy) NSString *uid;

@end
