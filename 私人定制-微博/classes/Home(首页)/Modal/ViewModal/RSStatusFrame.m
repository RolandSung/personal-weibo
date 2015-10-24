//
//  RSStatusFrame.m
//  私人定制-微博
//
//  Created by imac on 15/10/23.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatusFrame.h"
#import "RSStatus.h"


@implementation RSStatusFrame

-(void)setStatus:(RSStatus *)status{
    
    _status  = status;
    
    //计算原创微博
    
    [self computeOriginalViewFrame];
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
    
    //计算转发微博
    if (_status.retweeted_status) {
        
        [self computeRetweetlViewFrame];
        toolBarY = CGRectGetMaxY(_retweetViewFrame);
    }
    
    //计算工具条
    
    CGFloat toolBarX = 0;
    CGFloat toolBarH = 35;
    CGFloat toolBarW = RSKScreenWidth;
    
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    
    //计算cell高度

    _cellHeight = CGRectGetMaxY(_toolBarFrame);
    
    
}

- (void)computeOriginalViewFrame{
    
    //头像
    CGFloat iconX = RSStatusCellMargin;
    CGFloat iconY = iconX;
    CGFloat iconWH = 35;
    
    _originalIconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    //昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + RSStatusCellMargin;
    CGFloat nameY = iconY;
    
    //size with font ----ios7.0
    NSDictionary *attribute = @{NSFontAttributeName:RSNameFont};
    CGSize nameSize = [_status.user.name sizeWithAttributes:attribute];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    //Vip
    CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + RSStatusCellMargin;
    CGFloat vipY = nameY;
    CGFloat vipWH = 14;
    _originalVipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
    
   
    
    // 正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + RSStatusCellMargin;
#warning boundingRectWithSize
    CGFloat textW = RSKScreenWidth - 2 * RSStatusCellMargin;
    NSDictionary *textAttr = @{NSFontAttributeName:RSTextFont};
    CGSize textBoundSize = CGSizeMake(textW, MAXFLOAT);
    CGRect textRect = [_status.text boundingRectWithSize: textBoundSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:textAttr context:nil];
   
    textRect.origin.x = textX;
    textRect.origin.y = textY;
    _originalTextFrame = textRect;
    
    // 原创微博的frame
    CGFloat originX = 0;
    CGFloat originY = RSStatusCellMargin;
    CGFloat originW = RSKScreenWidth;
    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + RSStatusCellMargin;
    _originalViewFrame = CGRectMake(originX, originY, originW, originH);

    
    
    
    
    
}



- (void)computeRetweetlViewFrame{
    // 昵称
    CGFloat nameX = RSStatusCellMargin;
    CGFloat nameY = nameX;
    // 注意：一定要是转发微博的用户昵称
    NSDictionary *attribute = @{NSFontAttributeName:RSNameFont};
    CGSize nameSize = [_status.retweeted_status.user.name sizeWithAttributes:attribute];

    _retweetNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(_retweetNameFrame) + RSStatusCellMargin;
    
    CGFloat textW = RSKScreenWidth - 2 * RSStatusCellMargin;
    // 注意：一定要是转发微博的正文
    NSDictionary *textAttr = @{NSFontAttributeName:RSTextFont};
    CGSize textBoundSize = CGSizeMake(textW, MAXFLOAT);
    CGSize textSize = [_status.retweeted_status.text boundingRectWithSize:textBoundSize options: (NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)    attributes:textAttr context:nil].size;
    _retweetTextFrame = (CGRect){{textX,textY},textSize};

    
    // 转发微博的frame
    CGFloat retweetX = 0;
    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW = RSKScreenWidth;
    CGFloat retweetH = CGRectGetMaxY(_retweetTextFrame) + RSStatusCellMargin;
    _retweetViewFrame = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    

    
    
    
}



@end
