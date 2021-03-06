//
//  RSUser.h
//  私人定制-微博
//
//  Created by imac on 15/10/19.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSUser : NSObject

/**
 *  友好显示名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *  用户头像地址（中图），50×50像素
 */
@property (nonatomic,strong) NSURL *profile_image_url;



/** 会员类型 > 2代表是会员 */
@property (nonatomic, assign) int mbtype;
/** 会员等级 */
@property (nonatomic, assign) int mbrank;

@property (nonatomic, assign,getter=isVip) BOOL vip;

@end
