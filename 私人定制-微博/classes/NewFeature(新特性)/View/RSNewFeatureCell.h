//
//  RSNewFeatureCell.h
//  私人定制-微博
//
//  Created by imac on 15/10/15.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSNewFeatureCell : UICollectionViewCell

@property (nonatomic,strong) UIImage *image;


-(void)cellWithIndexpath:(NSIndexPath *)indexpath count:(NSInteger)count;

@end
