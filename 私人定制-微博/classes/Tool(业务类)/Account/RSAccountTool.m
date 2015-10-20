//
//  RSAccountTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSAccountTool.h"
#import "RSAccountParam.h"
#import "RSHttpTool.h"
#import "MJExtension.h"
#define RSAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]


@implementation RSAccountTool

static RSAccount *_account;

+(void)saveAccount:(RSAccount *)account{
    
    //归档
    [NSKeyedArchiver archiveRootObject:account toFile:RSAccountFileName];
        
    
}

+(RSAccount *)account{
    
    if (_account == nil) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:RSAccountFileName];
        
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {//过期
            
            return nil;
        }
    }
    
    
    return _account;
}


+ (void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure{
    
    
    RSAccountParam *param = [[RSAccountParam alloc]init];
    param.client_id = @"1938416786";
    param.client_secret = @"52f5ff37e7832eb91776e5c7bdfaa222";
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = @"https://github.com";
   
    
    [RSHttpTool POST:@"https://api.weibo.com/oauth2/access_token" parameters:param.keyValues success:^(id responseObject) {

        //字典转模型
        RSAccount *account = [RSAccount accountWithDictionary:responseObject];
        //归档
        [RSAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
    
    
    
    
    
    
}

@end
