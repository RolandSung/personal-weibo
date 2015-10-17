//
//  RSPopMenu.h
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSPopMenu : UIImageView

@property (nonatomic ,strong) UIView *contentView;


+ (instancetype)showInRect:(CGRect)rect;

+(void)hide;

@end
