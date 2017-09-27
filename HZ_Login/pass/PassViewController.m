//
//  PassViewController.m
//  HZ_Login
//
//  Created by 海子 on 2017/9/25.
//  Copyright © 2017年 海子. All rights reserved.
//

#import "PassViewController.h"
#import "WLCaptcheButton.h"

@interface PassViewController ()<UITextFieldDelegate>
{
    UITextField *userNameText;
    UITextField *VerificatioText;
    UITextField *passText1;
    UITextField *passText2;
}
// 验证码点击按钮
@property (nonatomic, strong) WLCaptcheButton *verificationCodeButton;
@end

@implementation PassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = HZColor(238, 238, 238);
    [self nav];
    [self layout];
    
    
}
- (void)nav{
    self.navigationItem.title = @"注册";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: HZColor(76, 160, 239),
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
}
- (void)layout{
    UIView *View = [[UIView alloc] init];
    View.backgroundColor = HZColor(255, 255, 255);
    [self.view addSubview:View];
    [View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
        make.height.equalTo(@243);
    }];
    
    UIView *hen1 = [[UIView alloc] init];
    hen1.backgroundColor = HZColor(238, 238, 238);
    [View addSubview:hen1];
    [hen1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(0);
        make.right.equalTo(View.mas_right).offset(0);
        make.height.equalTo(@1);
        make.top.equalTo(View.mas_top).offset(60);
    }];
    
    
    UIView *hen2 = [[UIView alloc] init];
    hen2.backgroundColor = HZColor(238, 238, 238);
    [View addSubview:hen2];
    [hen2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(0);
        make.right.equalTo(View.mas_right).offset(0);
        make.height.equalTo(@1);
        make.top.equalTo(hen1.mas_bottom).offset(60);
    }];
    
    
    UIView *hen3 = [[UIView alloc] init];
    hen3.backgroundColor = HZColor(238, 238, 238);
    [View addSubview:hen3];
    [hen3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(0);
        make.right.equalTo(View.mas_right).offset(0);
        make.height.equalTo(@1);
        make.top.equalTo(hen2.mas_bottom).offset(60);
    }];
    
    UIImageView *userImageview = [[UIImageView alloc] init];
    userImageview.image = [UIImage imageNamed:@"username"];
    [View addSubview:userImageview];
    [userImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View).offset(17);
        make.top.equalTo(View.mas_top).offset(17);
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
    [View addSubview:userNameText];
    [userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userImageview.mas_right).offset(15);
        make.top.equalTo(View.mas_top).offset(10);
        make.right.equalTo(View.mas_right).offset(-15);
        make.bottom.equalTo(hen1.mas_bottom).offset(-10);
    }];
    
    
    _verificationCodeButton = [[WLCaptcheButton alloc]init];
    [_verificationCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verificationCodeButton addTarget:self action:@selector(VerificatioClick:) forControlEvents:UIControlEventTouchUpInside];
    _verificationCodeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _verificationCodeButton.backgroundColor = HZColor(76, 160, 239);
    [View addSubview:_verificationCodeButton];
    _verificationCodeButton.clipsToBounds=YES;
    _verificationCodeButton.layer.cornerRadius=14;
    [_verificationCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hen1.mas_bottom).offset(15);
        make.right.equalTo(View.mas_right).offset(-15);
        make.bottom.equalTo(hen2.mas_top).offset(-15);
        make.width.equalTo(@95);
    }];
    
    
    UIImageView *VerificatioImageview = [[UIImageView alloc] init];
    VerificatioImageview.image = [UIImage imageNamed:@"yanzheng"];
    [View addSubview:VerificatioImageview];
    [VerificatioImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(17);
        make.top.equalTo(hen1.mas_bottom).offset(17);
        make.width.equalTo(@26);
        make.height.equalTo(@26);
    }];
    
    VerificatioText = [[UITextField alloc]init];
    VerificatioText.delegate = self;
    VerificatioText.tag = 2;
    VerificatioText.borderStyle = UITextBorderStyleNone;
    VerificatioText.backgroundColor = [UIColor whiteColor];
    VerificatioText.placeholder = @"请输入验证码";
    VerificatioText.font = [UIFont systemFontOfSize:17];
    VerificatioText.textColor = [UIColor blackColor];
    VerificatioText.clearButtonMode = UITextFieldViewModeWhileEditing;
    VerificatioText.keyboardType = UIKeyboardTypeNumberPad;
    [View addSubview:VerificatioText];
    [VerificatioText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(VerificatioImageview.mas_right).offset(15);
        make.top.equalTo(hen1.mas_bottom).offset(10);
        make.bottom.equalTo(hen2.mas_top).offset(-10);
        make.right.equalTo(_verificationCodeButton.mas_left).offset(-15);
    }];

    UIImageView *passImageview1 = [[UIImageView alloc] init];
    passImageview1.image = [UIImage imageNamed:@"password"];
    [View addSubview:passImageview1];
    [passImageview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(17);
        make.top.equalTo(hen2.mas_bottom).offset(15);
        make.width.equalTo(@26);
        make.height.equalTo(@30);
    }];
    
    passText1 = [[UITextField alloc]init];
    passText1.delegate = self;
    passText1.tag = 3;
    passText1.borderStyle = UITextBorderStyleNone;
    passText1.backgroundColor = [UIColor whiteColor];
    passText1.placeholder = @"请输入密码";
    passText1.secureTextEntry = YES;
    passText1.font = [UIFont systemFontOfSize:17];
    passText1.textColor = [UIColor blackColor];
    passText1.clearButtonMode = UITextFieldViewModeWhileEditing;
    passText1.keyboardType = UIKeyboardTypeDefault;
    [View addSubview:passText1];
    [passText1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passImageview1.mas_right).offset(15);
        make.top.equalTo(hen2.mas_bottom).offset(10);
        make.right.equalTo(View.mas_right).offset(-15);
        make.bottom.equalTo(hen3.mas_top).offset(-10);
    }];
    
    UIImageView *passImageview2 = [[UIImageView alloc] init];
    passImageview2.image = [UIImage imageNamed:@"password"];
    [View addSubview:passImageview2];
    [passImageview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(View.mas_left).offset(17);
        make.top.equalTo(hen3.mas_bottom).offset(15);
        make.width.equalTo(@26);
        make.height.equalTo(@30);
    }];
    
    passText2 = [[UITextField alloc]init];
    passText2.delegate = self;
    passText2.tag = 4;
    passText2.borderStyle = UITextBorderStyleNone;
    passText2.backgroundColor = [UIColor whiteColor];
    passText2.placeholder = @"请确认密码";
    passText2.secureTextEntry = YES;
    passText2.font = [UIFont systemFontOfSize:17];
    passText2.textColor = [UIColor blackColor];
    passText2.clearButtonMode = UITextFieldViewModeWhileEditing;
    passText2.keyboardType = UIKeyboardTypeDefault;
    [View addSubview:passText2];
    [passText2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passImageview1.mas_right).offset(15);
        make.top.equalTo(hen3.mas_bottom).offset(10);
        make.right.equalTo(View.mas_right).offset(-15);
        make.bottom.equalTo(View.mas_bottom).offset(-10);
    }];
    
    UIButton *PassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [PassBtn setTitle:@"注册" forState:UIControlStateNormal];
    [PassBtn setTitleColor:HZColor(255, 255, 255) forState:UIControlStateNormal];
    PassBtn.backgroundColor = HZColor(76, 160, 239);
    [PassBtn addTarget:self action:@selector(PassBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    PassBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:PassBtn];
    PassBtn.clipsToBounds=YES;
    PassBtn.layer.cornerRadius=17;
    [PassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-50);
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(View.mas_bottom).offset(65);
        make.height.equalTo(@35);
    }];
    
}

- (void)PassBtnClick:(UIButton *)sender{
    NSLog(@"注册");
}

- (void)VerificatioClick:(UIButton *)sender{
    [_verificationCodeButton fire];
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
        if (VerificatioText.text.length >= 4)
        {
            textField.text = [VerificatioText.text substringToIndex:4];
            return NO;
        }
    }
    if (textField.tag == 2) {
        if (passText2.text.length >= 16)
        {
            textField.text = [passText1.text substringToIndex:16];
            return NO;
        }
    }
    if (textField.tag == 2) {
        if (passText1.text.length >= 16)
        {
            textField.text = [passText2.text substringToIndex:16];
            return NO;
        }
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [userNameText resignFirstResponder];
    [VerificatioText resignFirstResponder];
    [passText1 resignFirstResponder];
    [passText2 resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 当点击键盘的返回键（右下角）时，执行该方法。
    // 一般用来隐藏键盘
    [userNameText resignFirstResponder];
    [VerificatioText resignFirstResponder];
    [passText1 resignFirstResponder];
    [passText2 resignFirstResponder];
    
    return YES;
}
@end
