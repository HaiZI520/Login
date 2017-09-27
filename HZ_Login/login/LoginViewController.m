//
//  LoginViewController.m
//  HZ_Login
//
//  Created by 海子 on 2017/9/25.
//  Copyright © 2017年 海子. All rights reserved.
//

#import "LoginViewController.h"
#import "PassViewController.h"
#import "Forget_PassViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField *userNameText;
    UITextField *passText;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HZColor(238, 238, 238);
    [self nav];
    [self layout];
}
- (void)nav{
    self.navigationItem.title = @"登录";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: HZColor(76, 160, 239),
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,30)];
    [rightButton setImage:[UIImage imageNamed:@"search.png"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"注册" forState:UIControlStateNormal];
    [rightButton setTitleColor:HZColor(0, 0, 0) forState:UIControlStateNormal];
    rightButton.titleLabel.font =[UIFont fontWithName:@"Helvetica-Bold" size:15];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
    
}

- (void)layout{
    UIView *userView = [[UIView alloc] init];
    userView.backgroundColor = HZColor(255, 255, 255);
    [self.view addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
        make.height.equalTo(@121);
    }];
    
    UIView *username = [[UIView alloc] init];
    [userView addSubview:username];
    [username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView).offset(0);
        make.right.equalTo(userView).offset(0);
        make.top.equalTo(userView).offset(0);
        make.height.equalTo(@60);
    }];
    
    UIView *hen = [[UIView alloc] init];
    hen.backgroundColor = HZColor(238, 238, 238);
    [userView addSubview:hen];
    [hen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView).offset(0);
        make.right.equalTo(userView).offset(0);
        make.top.equalTo(username.mas_bottom).offset(0);
        make.height.equalTo(@1);
    }];
    
    UIView *pass = [[UIView alloc] init];
    [userView addSubview:pass];
    [pass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView).offset(0);
        make.right.equalTo(userView).offset(0);
        make.top.equalTo(hen.mas_bottom).offset(0);
        make.height.equalTo(@60);
    }];
    
    UIImageView *userImageview = [[UIImageView alloc] init];
    userImageview.image = [UIImage imageNamed:@"username"];
    [username addSubview:userImageview];
    [userImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(username).offset(17);
        make.top.equalTo(username.mas_top).offset(17);
        make.width.equalTo(@26);
        make.height.equalTo(@26);
    }];
    
    userNameText = [[UITextField alloc]init];
    userNameText.delegate = self;
    userNameText.tag = 1;
    userNameText.borderStyle = UITextBorderStyleNone;
    userNameText.backgroundColor = [UIColor whiteColor];
    userNameText.placeholder = @"请输入手机号";
    userNameText.font = [UIFont systemFontOfSize:17];
    userNameText.textColor = [UIColor blackColor];
    userNameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNameText.keyboardType = UIKeyboardTypeNumberPad;
    [userView addSubview:userNameText];
    [userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userImageview.mas_right).offset(15);
        make.top.equalTo(username.mas_top).offset(10);
        make.right.equalTo(username.mas_right).offset(-15);
        make.bottom.equalTo(username.mas_bottom).offset(-10);
    }];
    
    UIImageView *passImageview = [[UIImageView alloc] init];
    passImageview.image = [UIImage imageNamed:@"password"];
    [username addSubview:passImageview];
    [passImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pass).offset(17);
        make.top.equalTo(pass.mas_top).offset(15);
        make.width.equalTo(@26);
        make.height.equalTo(@30);
    }];
    
    passText = [[UITextField alloc]init];
    passText.delegate = self;
    passText.tag = 2;
    passText.borderStyle = UITextBorderStyleNone;
    passText.backgroundColor = [UIColor whiteColor];
    passText.placeholder = @"请输入密码";
    passText.secureTextEntry = YES;
    passText.font = [UIFont systemFontOfSize:17];
    passText.textColor = [UIColor blackColor];
    passText.clearButtonMode = UITextFieldViewModeWhileEditing;
    passText.keyboardType = UIKeyboardTypeDefault;
    [userView addSubview:passText];
    [passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passImageview.mas_right).offset(15);
        make.top.equalTo(pass.mas_top).offset(10);
        make.right.equalTo(pass.mas_right).offset(-15);
        make.bottom.equalTo(pass.mas_bottom).offset(-10);
    }];
    
    
    UIButton *ForgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ForgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [ForgetBtn setTitleColor:HZColor(76, 160, 239) forState:UIControlStateNormal];
    [ForgetBtn addTarget:self action:@selector(ForgetClick:) forControlEvents:UIControlEventTouchUpInside];
    ForgetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:ForgetBtn];
    [ForgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(userView.mas_bottom).offset(20);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    
    
    UIButton *LoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [LoginBtn setTitleColor:HZColor(255, 255, 255) forState:UIControlStateNormal];
    LoginBtn.backgroundColor = HZColor(76, 160, 239);
    [LoginBtn addTarget:self action:@selector(LoginClick:) forControlEvents:UIControlEventTouchUpInside];
    LoginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:LoginBtn];
    LoginBtn.clipsToBounds=YES;
    LoginBtn.layer.cornerRadius=17;
    [LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-50);
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(userView.mas_bottom).offset(150);
        make.height.equalTo(@35);
    }];
    
}

- (void) zhuce{
    [userNameText resignFirstResponder];
    [passText resignFirstResponder];
    PassViewController *pass = [[PassViewController alloc] init];
    [self.navigationController pushViewController:pass animated:YES];    
}
- (void)ForgetClick:(UIButton *)sender{
    [userNameText resignFirstResponder];
    [passText resignFirstResponder];
    Forget_PassViewController *forget_pass = [[Forget_PassViewController alloc] init];
    [self.navigationController pushViewController:forget_pass animated:YES];
}
- (void)LoginClick:(UIButton *)sender{
    [userNameText resignFirstResponder];
    [passText resignFirstResponder];
    NSLog(@"登录");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 当点击键盘的返回键（右下角）时，执行该方法。
    // 一般用来隐藏键盘
    [userNameText resignFirstResponder];
    [passText resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    //string就是此时输入的那个字符 textField就是此时正在输入的那个输入框 返回YES就是可以改变输入框的值 NO相反
    
    if (textField.tag == 1)
    {
        if (userNameText.text.length >= 11)
        {
            textField.text = [userNameText.text substringToIndex:11];
            return NO;
        }
    }
    if (textField.tag == 2) {
        if (passText.text.length >= 16)
        {
            textField.text = [passText.text substringToIndex:16];
            return NO;
        }
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [userNameText resignFirstResponder];
    [passText resignFirstResponder];
}


@end
