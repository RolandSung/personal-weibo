
//
//  RSBadgeView.m
//  私人定制-微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSBadgeView.h"

@implementation RSBadgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self sizeToFit];
        
    }
    return self;
}


-(void)setBadgeValue:(NSString *)badgeValue{
    
    _badgeValue = badgeValue;
    
    if (badgeValue.length == 0 ||[badgeValue isEqualToString:@"0"]) {
        self.hidden = YES;
        
    }else{
        self.hidden = NO;
    }
    
#warning 方法更新
    CGSize size = [badgeValue sizeWithFont:[UIFont systemFontOfSize:11]];
    
    if (size.width > self.frame.size.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
        
    }
    
}













@end
