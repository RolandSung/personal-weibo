//
//  RSStatusCell.h
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSStatusFrame.h"

@interface RSStatusCell : UITableViewCell

@property (nonatomic,strong)RSStatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
