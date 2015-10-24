//
//  RSStatusToolBar.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatusToolBar.h"
#import "RSStatus.h"

@interface RSStatusToolBar ()

@property (nonatomic,strong) NSMutableArray *buttons;
@property (nonatomic,strong) NSMutableArray *divideVs;

@property (nonatomic,weak) UIButton *retweet;
@property (nonatomic,weak) UIButton *comment;
@property (nonatomic,weak) UIButton *unlike;

@end

@implementation RSStatusToolBar

-(NSMutableArray *)buttons{
    
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(NSMutableArray *)divideVs{
    
    if (_divideVs == nil) {
        _divideVs = [NSMutableArray array];
    }
    return _divideVs;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        //配置子视图
        [self configureChildViews];
        
        self.image = [UIImage imageWithStretchableImageName:@"timeline_card_bottom_background"];

    }
    
    return self;
}



- (void)configureChildViews{
    
    //转发
    
    UIButton *retweet = [self buttonWithTitle:@"转发" imageName:@"timeline_icon_retweet"];
    _retweet = retweet;
    //评论
    UIButton *comment = [self buttonWithTitle:@"评论" imageName:@"timeline_icon_comment"];
    _comment = comment;
    //赞
    UIButton *unlike = [self buttonWithTitle:@"赞" imageName:@"timeline_icon_unlike"];
    _unlike = unlike;
    
    for (int i = 0; i < 2; i++) {
        
    UIImageView *divideV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        
        [self addSubview:divideV];
        [self.divideVs addObject:divideV];
    }
    
    
}

- (UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imgName{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    [self addSubview:btn];
    
    //
    [self.buttons addObject:btn];
    
    return btn;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSUInteger count = self.buttons.count;
//    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = RSKScreenWidth/count;
    CGFloat h = self.height;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.buttons[i];
        btn.frame  = CGRectMake(i * w, y, w, h);
    }
    
    int i = 1;
    
    for (UIImageView *divideV in self.divideVs) {
        UIButton *btn = self.buttons[i];
        
        divideV.x = btn.x;
        i++;
        
    }
    
        
    
    }
    
-(void)setStatus:(RSStatus *)status{
    
    _status = status;
    
    //转发
    
    [self setButton:_retweet withTitleCount:status.reposts_count];
   
    //评论
    
    [self setButton:_comment withTitleCount:status.comments_count];
    
    //赞
    [self setButton:_unlike withTitleCount:status.attitudes_count];
    
    
}

//设置按钮标题
- (void)setButton:(UIButton *)button withTitleCount:(int)count{
    
    
    
    if (count) {
        NSString *title = nil;
        if (count >= 10000) {
            
            CGFloat  floutCount = count/10000.0;
            title = [NSString stringWithFormat:@"%.f万",floutCount];
            
        }else{
            
            title = [NSString stringWithFormat:@"%d",count];
            
        }
        [button setTitle:title forState:UIControlStateNormal];
    
    }
    
}

@end
