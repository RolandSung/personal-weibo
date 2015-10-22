//
//  RSUserResult.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSUserResult.h"

@implementation RSUserResult
-(int)messageCount{
    
    return (_cmt + _mention_cmt + _mention_status);
}

-(int)profileCount{
    
    return _follower + _dm;
}

-(int)totalCount{
    
    
    return self.messageCount + self.profileCount +_status;
}
@end
