//
//  RSStatusResult.h
//  私人定制-微博
//
//  Created by imac on 15/10/20.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface RSStatusResult : NSObject<MJKeyValue>
/**
 *  返回的用户微博数组
 */
@property (nonatomic ,strong) NSArray *statuses;

/**
 *    用户最近微博总数
 */
@property (nonatomic,assign) int total_number;




@end
