//
//  RSAccountTool.h
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSAccount.h"

@interface RSAccountTool : NSObject

+(void)saveAccount:(RSAccount *)account;

+(RSAccount *)account;

@end
