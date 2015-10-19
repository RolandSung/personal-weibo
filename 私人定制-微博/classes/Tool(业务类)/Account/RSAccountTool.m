//
//  RSAccountTool.m
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSAccountTool.h"
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

@end
