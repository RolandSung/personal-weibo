//
//  UIImage+RSImage.m
//  私人定制-微博
//
//  Created by imac on 15/10/14.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "UIImage+RSImage.h"

@implementation UIImage (RSImage)


+ (instancetype)imageWithStretchableImageName:(NSString *)imageName{
    
    UIImage *img = [UIImage imageNamed:imageName];
     return  [img stretchableImageWithLeftCapWidth:(img.size.width * 0.5) topCapHeight:(img.size.height * 0.5)];
    
}

@end
