//
//  RSTabBar.m
//  私人定制-微博
//
//  Created by imac on 15/10/8.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTabBar.h"

@interface RSTabBar ()

@property (nonatomic,weak)UIButton *plusButton;

@end

@implementation RSTabBar


-(UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
        
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:btn];
        
        
        
    }
    
    
    
    return _plusButton;
}




//布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int i = 0;
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnW =w/(self.items.count + 1);
    CGFloat btnH =h;
    
    for (UIView *tabBarButton in self.subviews) {
        if (i == 2) {
            i = 3;
        }
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            
            tabBarButton.frame = CGRectMake(btnW*i, 0, btnW, btnH);
            i++;
            
        }
    }
    
    self.plusButton.center = CGPointMake(w*0.5, h*0.5);
}


    
    
    @end
