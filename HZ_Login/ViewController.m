//
//  ViewController.m
//  HZ_Login
//
//  Created by 海子 on 2017/9/25.
//  Copyright © 2017年 海子. All rights reserved.
//

#import "ViewController.h"
#import "NavViewController.h"
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(100, 100, 100, 100);
    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}
- (void)loginBtn:(UIButton *)btn{
    NSLog(@"1");
    
    LoginViewController *login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
