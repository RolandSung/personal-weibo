//
//  RSRootVCTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSRootVCTool.h"
#import "RSTabBarController.h"
#import "RSNewFeatureController.h"
#define RSVersionKey @"lastVersion"


@implementation RSRootVCTool

+(void)chooseRootViewController:(UIWindow *)window{
    
    
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
        NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:RSVersionKey];
    
    
        //判断版本
        if ([currentVersion isEqualToString:lastVersion]) {
            window.rootViewController = [[RSTabBarController alloc]init];
    
    
        }else{
        //新特性
            window.rootViewController = [[RSNewFeatureController alloc]init];
    
            [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:RSVersionKey];
        
        }
        

    
    
}

@end
