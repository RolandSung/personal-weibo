//
//  RSRetweetView.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSRetweetView.h"
#import "RSStatus.h"

@interface RSRetweetView ()
/**
 *  昵称
 */
@property (nonatomic,weak)UILabel *nameView;

/**
 *  正文
 */
@property (nonatomic,weak)UILabel *textView;

@end

@implementation RSRetweetView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //配置子视图
        [self configureChildViews];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableImageName:@"timeline_retweet_background"];

    }
    
    return self;
}



- (void)configureChildViews{
    
    //昵称
    UILabel *nameView = [[UILabel alloc]init];
    nameView.font = RSNameFont;
    nameView.textColor = [UIColor colorWithRed:0 green:0.9 blue:1 alpha:0.9];

    [self addSubview:nameView];
    _nameView = nameView;

    //正文
    UILabel *textView = [[UILabel alloc]init];
    textView.numberOfLines = 0;
    textView.font = RSTextFont;
    [self addSubview:textView];
    _textView = textView;
    
    
}


-(void)setStatusFrame:(RSStatusFrame *)statusFrame{
    
    _statusFrame = statusFrame;
    
    
    RSStatus *status = statusFrame.status;
    // 昵称
    _nameView.frame = statusFrame.retweetNameFrame;
    _nameView.text = status.retweeted_status.user.name;
//    _nameView.text = status.retweetName;
    
    // 正文
    _textView.frame = statusFrame.retweetTextFrame;
    _textView.text = status.retweeted_status.text;
}
@end
