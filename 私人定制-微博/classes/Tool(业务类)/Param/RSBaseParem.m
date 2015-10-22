//
//  RSBaseParem.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSBaseParem.h"
#import "RSAccountTool.h"

@implementation RSBaseParem

+(instancetype)param{
    RSBaseParem *param = [[self alloc]init];
    param.access_token = [RSAccountTool account].access_token;
    return param;
}

@end
