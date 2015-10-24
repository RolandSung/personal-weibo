//
//  RSStatus.m
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatus.h"
#import "NSDate+MJ.h"

@implementation RSStatus


-(NSString *)created_at{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *creat_at = [fmt dateFromString:_created_at];
    
    if ([creat_at isThisYear]) {//今年
        if ([creat_at isToday]) {//今天
           //计算跟当前时间差距
            NSDateComponents *cmp = [creat_at deltaWithNow];
            
            RSLog(@"%ld---%ld-----%ld",cmp.day,cmp.hour,cmp.second);
            
            if (cmp.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前",cmp.hour];
            }else if(cmp.minute >= 1){
                return [NSString stringWithFormat:@"%ld分钟前",cmp.minute];
            }else{
                
                return @"刚刚";
            }
            
            
            
        }else if ([creat_at isYesterday]){//昨天
            
            fmt.dateFormat = @"昨天 HH:mm";
            _created_at = [fmt stringFromDate:creat_at];
            
        }else{
            
            fmt.dateFormat = @"MM-dd HH:mm";
            
            _created_at = [fmt stringFromDate:creat_at];
            
        }
        
        
    }else {//不是今年
        
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        
        _created_at = [fmt stringFromDate:creat_at];
        
    }
    return _created_at;
}

@end
