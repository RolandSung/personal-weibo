//
//  RSTabBarController.m
//  私人定制-微博
//
//  Created by imac on 15/10/8.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTabBarController.h"
#import "RSTabBar.h"

#import "RSHomeViewController.h"
#import "RSMessageViewController.h"
#import "RSDiscoverViewController.h"
#import "RSProfileViewController.h"

#import "RSNavigationController.h"


@interface RSTabBarController ()<RSTabBarDelegate>
@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation RSTabBarController

//设置TabBarItem的文字颜色



//+ (void)initialize
//{
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
//    NSMutableDictionary *att  =[NSMutableDictionary dictionary];
//    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    
//    [item setTitleTextAttributes:(att) forState:UIControlStateSelected];
//}

-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    
    [self _configureChileViewControllers];
    
    
    [self _setUpTabBar];
    

}

- (void) _setUpTabBar{


    RSTabBar *tabBar = [[RSTabBar alloc]initWithFrame:self.tabBar.frame];
    //自定义TabBar
    
    tabBar.backgroundColor =  [UIColor whiteColor];
    
    tabBar.alpha = 0.9;
    
    tabBar.delegate = self;
    
    tabBar.items = self.items;
    
    [self.view addSubview:tabBar];
    
    [self.tabBar removeFromSuperview];
    
    
    
    
    //    self.tabBar = tabBar;
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    


}


#pragma mark - 创建所有子控制器
- (void)_configureChileViewControllers
{
    //首页
    RSHomeViewController *home = [[RSHomeViewController alloc]init];
    [self _setUpOneChildViewControllers:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed: @"tabbar_home_selected"] title:@"首页"];

    
    //消息
    RSMessageViewController *message = [[RSMessageViewController alloc]init];
    [self _setUpOneChildViewControllers:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_selected"] title:@"消息"];
    

    
    //发现
    RSDiscoverViewController *discover = [[RSDiscoverViewController alloc]init];
    [self _setUpOneChildViewControllers:discover image:[UIImage imageNamed:@"tabbar_discover" ] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected"] title:@"发现"];
    
    //我
    RSProfileViewController *profile = [[RSProfileViewController alloc]init];
    [self _setUpOneChildViewControllers:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"] title:@"我"];
    
}

#pragma mark - 设置子控制器属性
- (void)_setUpOneChildViewControllers:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{

//    NSLog(@"%@",vc.tabBarItem.title);
     vc.title = title;
//    NSLog(@"%@",vc.tabBarItem.title);
    vc.tabBarItem.image = image;
    //加载原始图片 ， 不渲染
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.badgeValue = @"9";
    
    //设置 TabBarItem的文字颜色
    NSMutableDictionary *att  =[NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [vc.tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
    
    //保存tabBar模型到数组
    [self.items addObject:vc.tabBarItem];
    
    RSNavigationController *navigationContr = [[RSNavigationController alloc]initWithRootViewController:vc];
  
    [self addChildViewController:navigationContr];
    
}

#pragma mark - delegate

-(void)tabBar:(RSTabBar *)tabBar didClickButton:(NSInteger)index{
    
    self.selectedIndex  = index;
    
}

@end
