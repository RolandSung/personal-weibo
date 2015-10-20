//
//  RSStatusResult.m
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatusResult.h"
#import "RSStatus.h"


@implementation RSStatusResult

/**
 *  数组里的字典转的模型
 */
+(NSDictionary *)objectClassInArray{
    
    return @{@"statuses":[RSStatus class]};
}

@end
