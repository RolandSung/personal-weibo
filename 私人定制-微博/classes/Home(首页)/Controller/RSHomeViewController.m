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
#import "AFNetworking.h"
#import "RSAccountTool.h"
#import "MJExtension.h"
#import "RSStatus.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"


@interface RSHomeViewController ()<RSCoverDelegate>

@property(nonatomic,strong)RSMenuViewController *menuVC;
@property(nonatomic,strong) RSTitleButton *titleBtn;

@property (nonatomic,strong) NSMutableArray *statuses;

@end

@implementation RSHomeViewController

-(NSMutableArray *)statuses{
    if (_statuses == nil) {
        
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

-(RSMenuViewController *)menuVC{
    if (_menuVC == nil) {
        _menuVC = [[RSMenuViewController alloc]init];
        
    }
    return _menuVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self _setUpNavigationBar];
    
    
    
    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreStatus)];
    
    
    self.tableView.footer = footer;
    
    
    
    //下拉刷新
    
    MJRefreshGifHeader *header= [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewStatus)];
    
//    header.lastUpdatedTimeLabel.hidden = YES;
    
     self.tableView.header = header;
    
    //自动下拉刷新
    if (_statuses == nil) {
        [self.tableView.header beginRefreshing];

    }

    
}





#pragma mark - private method

- (void)loadMoreStatus{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    //请求参数
    parameter[@"access_token"] = [RSAccountTool account].access_token;
    //有数据才需要刷新
    if (self.statuses.count) {
        long long maxID = [[[self.statuses lastObject] idstr] longLongValue ]- 1 ;
        parameter[@"max_id"] =[NSString stringWithFormat:@"%lld",maxID];
    }
    
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        //结束上拉刷新
        [self.tableView.footer endRefreshing];
        
        NSArray *dictArr = responseObject[@"statuses"];
        
        //字典数组转模型数组
        NSArray *statuses = [RSStatus objectArrayWithKeyValuesArray:dictArr];
        
        //把元素添加进去
        [self.statuses addObjectsFromArray:statuses ];
        
        //刷新表格
        [self.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        
        RSLog(@"%@",error);
    }];

    
    
    
    
    
    
}

- (void)loadNewStatus{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    //请求参数
    parameter[@"access_token"] = [RSAccountTool account].access_token;
    if (self.statuses.count) {
        parameter[@"since_id"] = [self.statuses[0] idstr];
    }
    
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        //结束下拉刷新
        [self.tableView.header endRefreshing];
        
        NSArray *dictArr = responseObject[@"statuses"];
      
        //字典数组转模型数组
        NSArray *statuses = [RSStatus objectArrayWithKeyValuesArray:dictArr];
        
        NSIndexSet *indext = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statuses insertObjects:statuses atIndexes:indext];

        [self.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        
        RSLog(@"%@",error);
    }];
    
    
    
    
    
    
    
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
    [_titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    
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
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    RSStatus *status = self.statuses[indexPath.row];
    
    cell.textLabel.text = status.user.name;
    cell.detailTextLabel.text  =status.text;
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
