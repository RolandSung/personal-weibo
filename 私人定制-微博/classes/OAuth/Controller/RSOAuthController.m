//
//  RSOAuthController.m
//  私人定制-微博
//
//  Created by imac on 15/10/17.
//  Copyright © 2015年 Roland Sung. All rights reserved.
//

#import "RSOAuthController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "RSAccount.h"
#import "RSAccountTool.h"
#import "RSRootVCTool.h"

@interface RSOAuthController ()<UIWebViewDelegate>

@end

@implementation RSOAuthController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
//    [self.view addSubview:webView];
    self.view = webView;
    
    
    //加载网页
    //    base https://api.weibo.com/oauth2/authorize
    //    client_id	true	string	申请应用时分配的AppKey。
    //    redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一
        
    NSString *baseUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"1938416786";
    NSString *redirect_uri = @"https://github.com";
    
    //拼接
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
   
    //创建URL
    NSURL *url = [NSURL URLWithString:urlString];
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //加载请求
    [webView loadRequest:request];
    //设置代理
    webView.delegate = self;
    

}

#pragma mark - webView delegate
//加载开始
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    //进度圈

    
    [MBProgressHUD showHUDAddedTo:webView animated:YES];
    
}
//加载完成
-(void)webViewDidFinishLoad:(UIWebView *)webView{

    [MBProgressHUD hideHUDForView:webView animated:YES];
    
}
//加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [MBProgressHUD hideHUDForView:webView animated:YES];
}
//加载拦截
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    RSLog(@"%@",request);
   
    //获取code
    NSString *urlString = request.URL.absoluteString;
    NSRange range = [urlString rangeOfString:@"code="];
    
    if (range.length) {
        NSString *code = [urlString substringFromIndex:range.location + range.length];
        RSLog(@"%@",code);
        
        //用code获取accessToken
        [self accessTokenWithCode:code];
        
        return NO;
        
    }
    
    
    
    
    return YES;
}




- (void)accessTokenWithCode:(NSString *)code{
    
    //POST请求
    
    //创建请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *prams = [NSMutableDictionary dictionary];
    
    prams[@"client_id"] = @"1938416786";
    prams[@"client_secret"] = @"52f5ff37e7832eb91776e5c7bdfaa222";
    prams[@"grant_type"] = @"authorization_code";
    prams[@"code"] = code;
    prams[@"redirect_uri"] =@"https://github.com";
    
//    发送POST 请求
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:prams success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        "access_token" = "2.00LQwiwBsk5LHCbb428ed0a8gdK66E";
//        "expires_in" = 157679999;
//        "remind_in" = 157679999;
//        uid = 1783870707;

        //字典转模型
        RSAccount *account = [RSAccount accountWithDictionary:responseObject];
        [RSAccountTool saveAccount:account];
        
        [RSRootVCTool chooseRootViewController:RSKeyWindow];
        
        
    } failure:
    ^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        RSLog(@"%@",error);
    }];
    
    
}



@end
