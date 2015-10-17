//
//  RSTabBar.m
//  私人定制-微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTabBar.h"
#import "RSTabBarButton.h"

@interface RSTabBar ()

@property (nonatomic,weak) UIButton *plusButton;

@property (nonatomic,strong) NSMutableArray *buttons;

@property (nonatomic,weak) UIButton *selectedButton;

@end

@implementation RSTabBar





- (NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}


-(void)setItems:(NSArray *)items{
    
    _items = items;
    
    for (UITabBarItem *item in _items) {
        RSTabBarButton *btn = [RSTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.item = item;
        btn.tag = _buttons.count;
        
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        //默认选中第0个
        if (btn.tag == 0) {
            [self buttonClick:btn];
            
        }
        
        /////////
        [self addSubview:btn];
        
        
        [self.buttons addObject:btn];

    }
    
    
}

- (void)buttonClick:(UIButton*)button{
    
    _selectedButton.selected = NO;
    
    button.selected  = YES;
    
    _selectedButton = button;
    
  //切换控制机器
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
      
        [_delegate tabBar:self didClickButton:button.tag];
}


}

- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:_plusButton];
        
    }
    return _plusButton;
}


//布局子视图
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    
    int i = 0;
    // 设置tabBarButton的frame
    for (UIView *tabBarButton in self.buttons) {
        if (i == 2) {
            i = 3;
        }
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    
    
    // 设置添加按钮的位置
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    

}



@end
