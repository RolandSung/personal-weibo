//
//  RSTitleButton.m
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTitleButton.h"

@implementation RSTitleButton

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       //高亮时候不需要调整图片
        self.adjustsImageWhenHighlighted = NO;
        
        UIImage *image = [UIImage imageNamed:@"navigationbar_filter_background_highlighted"];
        ;


    [self setBackgroundImage:[ image stretchableImageWithLeftCapWidth:(image.size.width * 0.5) topCapHeight:(image.size.height * 0.5)] forState:UIControlStateHighlighted];
        
    }
    return self;
}

//将图片放在文字右边
-(void)layoutSubviews{
    
    [super layoutSubviews];
    if (self.currentImage == nil) {
        return;
    }
    
    self.titleLabel.x = 0;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
    
    
}

//重写set方法
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
    

}
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

@end
