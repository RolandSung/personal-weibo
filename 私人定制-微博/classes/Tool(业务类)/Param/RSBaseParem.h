//
//  RSBaseParem.h
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSBaseParem : NSObject

@property (nonatomic ,copy) NSString *access_token;


+ (instancetype)param;

@end
