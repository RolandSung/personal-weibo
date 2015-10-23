//
//  RSOriginalView.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSOriginalView.h"
#import "RSStatus.h"
#import "UIImageView+WebCache.h"


@interface RSOriginalView ()

@property (nonatomic,weak)UIImageView *iconView;
@property (nonatomic,weak)UILabel *nameView;
@property (nonatomic,weak)UIImageView *vipView;
@property (nonatomic,weak)UILabel *timeView;
@property (nonatomic,weak)UILabel *sourceView;
@property (nonatomic,weak)UILabel *textView;



@end



@implementation RSOriginalView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //配置子视图
        [self configureChildViews];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"timeline_card_top_background"];
    }
    
    return self;
}



- (void)configureChildViews{
    
    //头像
    UIImageView *iconView = [[UIImageView alloc]init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    //昵称
    UILabel *nameView = [[UILabel alloc]init];
    nameView.font = RSNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    //VIP
    UIImageView *vipView = [[UIImageView alloc]init];
    [self addSubview:vipView];
    _vipView = vipView;
    
    //时间
    UILabel *timeView = [[UILabel alloc]init];
    timeView.font = RSTimeFont;
    [self addSubview:timeView];
    _timeView = timeView;
    
    //来源
    UILabel *sourceView = [[UILabel alloc]init];
    sourceView.font = RSTimeFont;
    [self addSubview:sourceView];
    _sourceView = sourceView;
    
    //正文
    UILabel *textView = [[UILabel alloc]init];
    textView.font = RSTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    
    
}

-(void)setStatusFrame:(RSStatusFrame *)statusFrame{
    
    _statusFrame = statusFrame;
    
    [self configureFrame];
    [self configureData];
    
    
   }

- (void)configureFrame{
    //头像
    _iconView.frame = _statusFrame.originalIconFrame;
    
    // 昵称
    _nameView.frame = _statusFrame.originalNameFrame;
    
    // vip
    if (_statusFrame.status.user.vip) { // 是vip
        _vipView.hidden = NO;
        _vipView.frame = _statusFrame.originalVipFrame;
    }else{
        _vipView.hidden = YES;
    }
    // 时间
    _timeView.frame = _statusFrame.originalTimeFrame;
    
    // 来源
    _sourceView.frame = _statusFrame.originalSourceFrame;
    
    // 正文
    _textView.frame = _statusFrame.originalTextFrame;

}

- (void)configureData{
    
    RSStatus *status = _statusFrame.status;
    // 头像
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    // 昵称
    if (status.user.vip) {
        _nameView.textColor = [UIColor redColor];
    }else{
        _nameView.textColor = [UIColor blackColor];
    }
    _nameView.text = status.user.name;
    
    // vip
    NSString *imageName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    UIImage *image = [UIImage imageNamed:imageName];
    
    _vipView.image = image;
    
    // 时间
    _timeView.text = status.created_at;
    
    // 来源
    
    _sourceView.text = status.source;
    
    // 正文
    _textView.text = status.text;

    
}

@end
