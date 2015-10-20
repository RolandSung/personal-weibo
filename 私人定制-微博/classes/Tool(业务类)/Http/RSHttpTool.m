//
//  RSHttpTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//  处理网络请求

#import "RSHttpTool.h"
#import "AFNetworking.h"

@implementation RSHttpTool

//
+(void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //AFN请求成功的时候 调用 success 传值
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
    
    
}


+(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

@end

