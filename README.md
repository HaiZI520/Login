# Login

登录，注册，忘记密码整套流程

# 使用方式

在需要跳转登录的页面导入 

    #import "LoginViewController.h"

在登录入口添加

    LoginViewController * login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];


