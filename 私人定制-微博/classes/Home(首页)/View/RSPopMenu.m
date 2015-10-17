//
//  RSPopMenu.m
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSPopMenu.h"
#import "RSMenuViewController.h"

@implementation RSPopMenu

//显示菜单
+ (instancetype)showInRect:(CGRect)rect{
    RSPopMenu *popView = [[RSPopMenu alloc]initWithFrame:rect];

    popView.userInteractionEnabled = YES;
    
    popView.alpha = 0.9;
    
    UIImage *image = [UIImage imageNamed:@"popover_background"];
    
    //图片可按比例拉伸
   popView.image = [ image stretchableImageWithLeftCapWidth:(image.size.width * 0.5) topCapHeight:(image.size.height * 0.5)];
    
    [RSKeyWindow addSubview:popView];
    
    
    return popView;
    
}


//设置内容视图
-(void)setContentView:(UIView *)contentView{
    
    [_contentView removeFromSuperview];
    
    _contentView  = contentView;
    
    contentView.backgroundColor = [UIColor clearColor];
    
   // NSLog(@"%@%@",_contentView,contentView);
    [self addSubview:contentView];
    
}

+(void)hide{
    
    for (UIView *view in RSKeyWindow.subviews) {
        if ([view isKindOfClass:self]) {
            [view removeFromSuperview];
    
        }
    }
    
}

//布局 tableView
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat y = 12;
    CGFloat w = self.width - margin * 2;
    CGFloat h = self.height - y - margin;
    
    _contentView.frame =CGRectMake(x, y, w, h);
    
}

@end
