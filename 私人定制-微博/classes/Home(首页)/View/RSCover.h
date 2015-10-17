//
//  RSCover.h
//  私人定制-微博
//
//  Created by imac on 15/10/13.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RSCover;


@protocol RSCoverDelegate <NSObject>

@optional

- (void)coverDidClicked:(RSCover*)cover;

@end


@interface RSCover : UIView

@property (nonatomic, weak)  id<RSCoverDelegate> delegate;
    
+ (instancetype)show;

@end
