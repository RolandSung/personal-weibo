//
//  RSStatusTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatusTool.h"
#import "RSStatusParam.h"
#import "RSAccountTool.h"
#import "RSHttpTool.h"
#import "RSStatusResult.h"
#import "MJExtension.h"

@implementation RSStatusTool

+(void)newStatusWithSinceID:(NSString *)sinceID success:(void (^)(NSArray *))sucess failure:(void (^)(NSError *))failure{
    
    RSStatusParam *param = [[RSStatusParam alloc]init];
    param.access_token =  [RSAccountTool account].access_token;
    
    if (sinceID) {//有微博数据，才需要下拉刷新
        
        param.since_id = sinceID;
    }
    
    //网络请求
    [RSHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) {
        
        RSStatusResult *result = [RSStatusResult objectWithKeyValues:responseObject];
        
        if (sucess) {
            sucess(result.statuses);
        }
        
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
        
    }];
    
    
    
}


+(void)moreStatusWithMaxID:(NSString *)maxID success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{
    
    
    RSStatusParam *param = [[RSStatusParam alloc]init];

    param.access_token = [RSAccountTool account].access_token;

    if (maxID) {//有微博数据才获取更多
        param.max_id = maxID;
    }
    
    [RSHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) {
        
        RSStatusResult *result = [RSStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);//回传解析过的数组
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
