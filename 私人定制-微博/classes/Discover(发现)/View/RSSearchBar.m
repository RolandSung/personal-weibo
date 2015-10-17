//
//  RSSearchBar.m
//  私人定制-微博
//
//  Created by imac on 15/10/14.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSSearchBar.h"

@implementation RSSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        self.background = [UIImage imageWithStretchableImageName:@"searchbar_textfield_background"];
        self.font = [UIFont systemFontOfSize:13];
        
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView = imageV;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}

@end
