//
//  RSTabBarButton.m
//  私人定制-微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTabBarButton.h"
#import "RSBadgeView.h"


@interface RSTabBarButton ()

@property (nonatomic,weak)RSBadgeView *badgeView;
@end


@implementation RSTabBarButton

//重写取消高亮
-(void)setHighlighted:(BOOL)highlighted{
    
}


//badgeView懒加载
-(RSBadgeView *)badgeView{
    

if (_badgeView == nil) {
        RSBadgeView *badgeView = [RSBadgeView buttonWithType:UIButtonTypeCustom];
    _badgeView = badgeView;
    [self addSubview:_badgeView];
    }
    return _badgeView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame] ) {
    //设置字体颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        //内容格式
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        
    }
    return self;
}

-(void)setItem:(UITabBarItem *)item{
    
    _item = item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    // KVO：时刻监听一个对象的属性有没有改变
    // 给谁添加观察者
    // Observer:按钮
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
}
//监听到改变时调用


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    [self setTitle:_item.title forState:UIControlStateNormal];
    
    [self setImage:_item.image forState:UIControlStateNormal];
    
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    self.badgeView.badgeValue = _item.badgeValue;
    
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    // 2.title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 3.badgeView
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}


@end
