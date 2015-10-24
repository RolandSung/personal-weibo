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
    
//    RSLog(@"%@",_created_at);
//    _created_at = @"Sat Oct 23 14:24:17 +0800 2014";

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *creat_at = [fmt dateFromString:_created_at];
    
    if ([creat_at isThisYear]) {//今年
        if ([creat_at isToday]) {//今天
     
           //计算跟当前时间差距
            NSDateComponents *cmp = [creat_at deltaWithNow];
            
//            RSLog(@"%ld---%ld-----%ld",cmp.day,cmp.hour,cmp.second);
            
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


-(void)setSource:(NSString *)source{
    
//   <a href="http://app.weibo.com/t/feed/3G5oUM" rel="nofollow">iPhone 5s</a>
    
    //截取字符串
    
    NSRange range = [source rangeOfString:@">"];
//    RSLog(@"%ld--------%ld",range.location,range.length);
    
    source = [source substringFromIndex:range.location+range.length];
//    RSLog(@"%@",_source);

    range = [source rangeOfString:@"<"];
//    RSLog(@"%ld--------%ld",range.location,range.length);
    
    source = [source substringToIndex:range.location];
    
//    RSLog(@"%@",_source);

    source = [NSString stringWithFormat:@"来自 %@",source];
    
    
    _source = source;
}
-(void)setRetweeted_status:(RSStatus *)retweeted_status
{
    _retweeted_status = retweeted_status;
    
//    _retweetName =  [NSString stringWithFormat:@"@%@",_retweeted_status.user.name];
    
    _retweeted_status.user.name = [NSString stringWithFormat:@"@%@",_retweeted_status.user.name];


}
    

@end
