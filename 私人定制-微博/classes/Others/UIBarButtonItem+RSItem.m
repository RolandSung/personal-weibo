//
//  UIBarButtonItem+RSItem.m
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "UIBarButtonItem+RSItem.h"

@implementation UIBarButtonItem (RSItem)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image hightlightedImage:(UIImage *)hightlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:hightlightedImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    [btn sizeToFit];
    
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
