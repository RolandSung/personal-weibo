//
//  RSTabBarController.m
//  私人定制-微博
//
//  Created by imac on 15/10/8.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSTabBarController.h"
#import "RSTabBar.h"

@interface RSTabBarController ()

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



- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    
    [self _configureChileViewControllers];
    
    RSTabBar *tabBar = [[RSTabBar alloc]initWithFrame:self.tabBar.frame];
    //自定义TabBar
    
//    self.tabBar = tabBar;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建所有子控制器
- (void)_configureChileViewControllers
{
    //首页
    UIViewController *home = [[UIViewController alloc]init];
    [self _setUpOneChildViewControllers:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed: @"tabbar_home_selected"] title:@"首页"];
    home.view.backgroundColor =[UIColor blueColor];
    
    //消息
    UIViewController *message = [[UIViewController alloc]init];
    
    [self _setUpOneChildViewControllers:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_selected"] title:@"消息"];
    
    message.view.backgroundColor = [UIColor greenColor];
    
    //发现
    UIViewController *discover = [[UIViewController alloc]init];
    [self _setUpOneChildViewControllers:discover image:[UIImage imageNamed:@"tabbar_discover" ] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected"] title:@"发现"];
    discover.view.backgroundColor = [UIColor brownColor];
    
    //我
    UIViewController *profile = [[UIViewController alloc]init];
    [self _setUpOneChildViewControllers:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"] title:@"我"];
    profile.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - 设置子控制器属性
- (void)_setUpOneChildViewControllers:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    //加载原始图片 ， 不渲染
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.badgeValue = @"99";
    
    //设置 TabBarItem的文字颜色
    NSMutableDictionary *att  =[NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [vc.tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
    
    [self addChildViewController:vc];
    
}

@end
