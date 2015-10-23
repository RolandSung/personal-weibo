//
//  RSStatusFrame.h
//  私人定制-微博
//
//  Created by imac on 15/10/23.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RSStatus;

@interface RSStatusFrame : NSObject

/**
 *  微博数据
 */
@property (nonatomic,strong) RSStatus *status;

/**
 *  原创微博frame
 */
@property (nonatomic,assign) CGRect originalViewFrame;

//*   ***********原创微博子控件****************   *//

/**
 *  头像frame
 */
@property (nonatomic,assign) CGRect originalIconFrame;

/**
 *  昵称frame
 */
@property (nonatomic,assign) CGRect originalNameFrame;

/**
 *  Vip frame
 */
@property (nonatomic,assign) CGRect originalVipFrame;

/**
 *  来源frame
 */
@property (nonatomic,assign) CGRect originalSourceFrame;


/**
 *  时间frame
 */
@property (nonatomic,assign) CGRect originalTimeFrame;


/**
 *  正文frame
 */
@property (nonatomic,assign) CGRect originalTextFrame;





/**
 *  转发微博frame
 */
@property (nonatomic,assign) CGRect retweetViewFrame;

//*   ***********转发微博子控件****************   *//


/**
 *  转发微博 昵称frame
 */
@property (nonatomic,assign) CGRect retweetNameFrame;

/**
 *  转发微博 正文frame
 */
@property (nonatomic,assign) CGRect retweetTextFrame;




/**
 *  工具条frame
 */
@property (nonatomic ,assign) CGRect toolBarFrame;




/**
 *  cell的高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

@end
