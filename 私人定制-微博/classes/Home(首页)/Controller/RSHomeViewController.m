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


@interface RSHomeViewController ()<RSCoverDelegate>

@property(nonatomic,strong)RSMenuViewController *menuVC;
@property(nonatomic,strong) RSTitleButton *titleBtn;

@end

@implementation RSHomeViewController

-(RSMenuViewController *)menuVC{
    if (_menuVC == nil) {
        _menuVC = [[RSMenuViewController alloc]init];
        
    }
    return _menuVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setUpNavigationBar];
    
    
}




#pragma mark - private method
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
