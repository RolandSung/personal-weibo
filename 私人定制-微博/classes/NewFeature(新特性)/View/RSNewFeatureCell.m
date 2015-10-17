//
//  RSNewFeatureCell.m
//  私人定制-微博
//
//  Created by imac on 15/10/15.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSNewFeatureCell.h"
#import "RSTabBarController.h"

@interface RSNewFeatureCell ()

@property (nonatomic , weak) UIImageView *imageView;
@property (nonatomic,weak) UIButton *shareButton;
@property (nonatomic,weak) UIButton *starButton;

@end



@implementation RSNewFeatureCell

#pragma mark - subviews属性设置
-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc]init];
        
        _imageView = imageV;
        
        //加载到contentView
        [self.contentView addSubview:imageV];
        
    }
    return _imageView;
}

-(UIButton *)shareButton{
    
    if (_shareButton == nil) {
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal ];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        [self.contentView addSubview:btn];
        _shareButton = btn;
    
    }
    return _shareButton;
}

-(UIButton *)starButton{
    
    if (_starButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"开始微博" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(starAction) forControlEvents:UIControlEventTouchUpInside];
        _starButton = btn;
        [self.contentView addSubview:btn];
    }
    
    return _starButton;
}

#pragma mark - 布局子视图
-(void)layoutSubviews{
    
    self.imageView.frame = self.bounds;
    
    self.shareButton.center = CGPointMake(self.width * 0.5, self.height * 0.8);
    self.starButton.center =  CGPointMake(self.width * 0.5, self.height * 0.9);
    
}


-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    [self.imageView setImage:image];
    
}

-(void)cellWithIndexpath:(NSIndexPath *)indexpath count:(NSInteger)count{
    if (indexpath.row == count -1) {
        self.starButton.hidden =NO;
        self.shareButton.hidden =NO;
        
    }else{
        self.starButton.hidden = YES;
        self.shareButton.hidden =YES;
    }
    
    
    
}

- (void)starAction{
    
    RSKeyWindow.rootViewController = [[RSTabBarController alloc]init];
}

@end
