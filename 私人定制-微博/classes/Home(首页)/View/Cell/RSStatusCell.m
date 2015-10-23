//
//  RSStatusCell.m
//  私人定制-微博
//
//  Created by imac on 15/10/22.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSStatusCell.h"
#import "RSOriginalView.h"
#import "RSRetweetView.h"
#import "RSStatusToolBar.h"
#import "RSStatus.h"


@interface RSStatusCell ()

@property (nonatomic,weak) RSOriginalView *originalView;
@property (nonatomic,weak) RSRetweetView *retweetView;
@property (nonatomic,weak) RSStatusToolBar *toolBar;

@end

@implementation RSStatusCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //配置子视图
        [self configureChildViews];
    }
    
    return self;
}



- (void)configureChildViews{
    
    //原创微博
    RSOriginalView *originalView = [[RSOriginalView alloc]init];
    [self addSubview:originalView];
    _originalView = originalView;
    
    //转发微博
    RSRetweetView *retweetView  = [[RSRetweetView alloc]init];
    [self addSubview:retweetView];
    _retweetView = retweetView;
    
    //工具条
    RSStatusToolBar *toolBar = [[RSStatusToolBar alloc]init];
    [self addSubview:toolBar];
    _toolBar = toolBar;
    
    
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"cell";
    RSStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    return cell;
    
}


/*
 
 1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能确定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 
 解决:MVVM思想
 M:模型
 V:视图
 VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）
 
 
 */

-(void)setStatusFrame:(RSStatusFrame *)statusFrame{
    
    
    _statusFrame = statusFrame;
    //设置原微博的frame
    _originalView.frame = statusFrame.originalViewFrame;
    _originalView.statusFrame = statusFrame;
    
    //设置转发微博的frame
    
    _retweetView.frame = statusFrame.retweetViewFrame;
    _retweetView.statusFrame = statusFrame;
    //设置工具条的frame

    _toolBar.frame = statusFrame.toolBarFrame;
    
    
}

@end
