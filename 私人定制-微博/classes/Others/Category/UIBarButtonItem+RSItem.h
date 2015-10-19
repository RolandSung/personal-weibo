//
//  UIBarButtonItem+RSItem.h
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (RSItem)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image hightlightedImage:(UIImage *)hightlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
