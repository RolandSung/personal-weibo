//
//  RSCover.m
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSCover.h"

@implementation RSCover

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)show{
    RSCover *cover = [[RSCover alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    cover.backgroundColor = [UIColor clearColor];
    
    //主窗口添加
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
    
    return cover;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //移除蒙版
    [self removeFromSuperview];
    //通知代理去移除 menu 将按钮设置为未选中状态
    if ([_delegate respondsToSelector:@selector(coverDidClicked:)]) {
        [_delegate coverDidClicked:self];
    }
    
}
@end
