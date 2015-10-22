//
//  RSUserTool.h
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSUserResult.h"

@interface RSUserTool : NSObject

+ (void)unreadWithSuccess:(void(^)(RSUserResult *result))success failure:(void(^)(NSError *error))failure;

@end
