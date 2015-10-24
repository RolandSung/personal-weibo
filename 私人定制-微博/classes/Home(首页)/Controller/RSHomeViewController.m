//
//  RSHomeViewController.m
//  私人定制-微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSHomeViewController.h"
#import "RSMenuViewController.h"

#import "UIBarButtonItem+RSItem.h"
#import "RSTitleButton.h"
#import "RSCover.h"
#import "RSPopMenu.h"
#import "RSAccountTool.h"
#import "MJExtension.h"
#import "RSStatus.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "RSHttpTool.h"
#import "RSStatusTool.h"
#import "RSUserTool.h"

#import "RSStatusCell.h"
#import "RSStatusFrame.h"

//#import "RSUser.h"


@interface RSHomeViewController ()<RSCoverDelegate>

@property(nonatomic,strong)RSMenuViewController *menuVC;
@property(nonatomic,strong) RSTitleButton *titleBtn;


/**
 *  ViewModal
 */
@property (nonatomic,strong) NSMutableArray *statusFrames;
@end

@implementation RSHomeViewController

-(NSMutableArray *)statusFrames{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
    
}


-(RSMenuViewController *)menuVC{
    if (_menuVC == nil) {
        _menuVC = [[RSMenuViewController alloc]init];
        
    }
    return _menuVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9  blue:0.9 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self _setUpNavigationBar];
    
    
    //上拉添加

    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreStatus)];
    
    
    self.tableView.footer = footer;
    
    
    
    //下拉刷新
    
    MJRefreshGifHeader *header= [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewStatus)];
    
//    header.lastUpdatedTimeLabel.hidden = YES;
    
     self.tableView.header = header;
    
    //自动下拉刷新
    if (_statusFrames == nil) {
        [self.tableView.header beginRefreshing];

    }

    
    
    //请求当前用户昵称
    
     [RSUserTool userInfoWithSuccess:^(RSUser *user) {
        
         //设置标题栏
         [self.titleBtn setTitle:user.name forState:UIControlStateNormal];
         //保存昵称信息
        RSAccount *account = [RSAccountTool account];
         account.name = user.name;
         
         [RSAccountTool saveAccount:account];
         
    } failure:^(NSError *error) {
        
        
    }];
    
}

#pragma mark - 刷新最新的微博
-(void)refresh{
    
    [self.tableView.header beginRefreshing];
    
    
}


#pragma mark - 上拉加载更多

- (void)loadMoreStatus{
    
    NSString *maxIDstr = nil;
    if (self.statusFrames.count) {
        
        RSStatusFrame *statusF = [self.statusFrames lastObject];
     long long  maxID = [[statusF.status idstr] longLongValue] -1;
        maxIDstr = [NSString stringWithFormat:@"%lld",maxID];
    }
    
    [RSStatusTool moreStatusWithMaxID:maxIDstr success:^(NSArray *statuses) {
        
        [self.tableView.footer endRefreshing];
        
        //模型 -转换->> 视图模型
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (RSStatus *status in statuses) {
            RSStatusFrame *statusFrame = [[RSStatusFrame alloc]init];
            statusFrame.status = status;
            [statusFrames addObject:statusFrame];
        }
        
        [self.statusFrames addObjectsFromArray:statusFrames ];
        
        //刷新表格
        [self.tableView reloadData];

        
    } failure:^(NSError *error) {
        
        [self.tableView.footer endRefreshing];

        
        RSLog(@"%@",error);
    }];
    
    
    
    
    
}
#pragma mark - 下拉更新
- (void)loadNewStatus{
    
    NSString *sinceID = nil;
    if (self.statusFrames.count) {//有数据才需要刷新
        
        RSStatusFrame *statusF = self.statusFrames[0];
        sinceID = [statusF.status idstr];
    }
   
    [RSStatusTool newStatusWithSinceID:sinceID success:^(NSArray *statuses) {
        
        [self.tableView.header endRefreshing];
        
        //显示刷新的微博数
        [self showNewStatusCount:(int)statuses.count];

        
        //模型 -转换->> 视图模型
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (RSStatus *status in statuses) {
            RSStatusFrame *statusFrame = [[RSStatusFrame alloc]init];
            statusFrame.status = status;
            [statusFrames addObject:statusFrame];
        }

        
        
        //新微博排到前边
        NSIndexSet *indext = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statusFrames insertObjects:statusFrames atIndexes:indext];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        RSLog(@"%@",error);
        [self.tableView.header endRefreshing];
        
    }];
}


- (void)showNewStatusCount:(int)count{
    
    CGFloat h = 35.0;
    CGFloat x = 0.0;
    CGFloat w = RSKScreenWidth;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - h ;
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    lable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    lable.textColor = [UIColor whiteColor];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    if (count == 0) {
        lable.text = @"没有更新的微博";
    }else{
    lable.text = [NSString stringWithFormat:@"已刷新%d条微博",count];
    }
    
    //插入导航条下面
    [self.navigationController.view insertSubview:lable belowSubview:self.navigationController.navigationBar];
    
    //平移动画
    [UIView animateWithDuration:1 animations:^{
        //向下平移出来
        lable.transform = CGAffineTransformMakeTranslation(0, h);
        
    } completion:^(BOOL finished) {
        
    
        [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            //还原
            lable.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            //移除
            [lable removeFromSuperview];
            
        }];
    }
     
     ];
    
    
}
#pragma mark - 设置导航条
- (void)_setUpNavigationBar{
    
    //zuobian
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] hightlightedImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] hightlightedImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    //中间
    
    _titleBtn = [RSTitleButton buttonWithType:UIButtonTypeCustom];
    
    [_titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [_titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    //设置
    
    NSString *title = [RSAccountTool account].name ?:@"首页";
    
    [_titleBtn setTitle:title forState:UIControlStateNormal];
    
    [_titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
   
    self.navigationItem.titleView = _titleBtn;
    
    
}

- (void)titleClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    
    //弹出蒙版
    RSCover *cover = [RSCover show];
    cover.delegate = self;
    
    //弹出pop菜单

    float popX = (self.view.width - 200) * 0.5;
    float popY = 55;
    float popW = 200;
    float popH = 200;
   
    RSPopMenu *menu = [RSPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
   
    //懒加载  需用点语法
    menu.contentView =self.menuVC.view;
    
    
}
//左
- (void)friendSearch{
    
}

//右
- (void)pop{
    
}

#pragma  mark - degelate

-(void)coverDidClicked:(RSCover *)cover{
    
    [RSPopMenu hide];
    
    
    _titleBtn.selected = NO;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RSStatusCell *cell = [RSStatusCell cellWithTableView:tableView];
    
    
    RSStatusFrame *statusF = self.statusFrames[indexPath.row];
    
    //cell传递 模型
    cell.statusFrame = statusF;
    
//    cell.textLabel.text = status.user.name;
//    cell.detailTextLabel.text  =status.text;
//    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取ViewModal
    RSStatusFrame *statusF = self.statusFrames[indexPath.row];
    
    
    
    return  statusF.cellHeight;
}


@end
