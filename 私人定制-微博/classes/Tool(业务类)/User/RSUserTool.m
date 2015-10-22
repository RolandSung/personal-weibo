//
//  RSUserTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSUserTool.h"
#import "RSUserParam.h"
#import "RSAccountTool.h"
#import "RSHttpTool.h"
#import "MJExtension.h"

@implementation RSUserTool
    
    
+ (void)unreadWithSuccess:(void(^)(RSUserResult *result))success failure:(void(^)(NSError *error))failure{
    
   //参数模型
    RSUserParam *param = [RSUserParam param];
    param.uid = [RSAccountTool account].uid;
    
    [RSHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(id responseObject) {
        
        RSUserResult *result = [RSUserResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            
            failure(error);
        }
    }];
    
    
    
    
    
    
}


@end
