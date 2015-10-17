//
//  RSTabBar.h
//  私人定制-微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RSTabBar;

@protocol RSTabBarDelegate <NSObject>

@optional
- (void)tabBar:(RSTabBar *) tabBar didClickButton:(NSInteger)index;

@end




@interface RSTabBar : UIView

@property (nonatomic,strong) NSArray *items;

@property (nonatomic,weak) id<RSTabBarDelegate> delegate;
@end
