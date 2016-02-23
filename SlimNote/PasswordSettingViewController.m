//
//  PasswordSettingViewController.m
//  SlimNote
//
//  Created by 胡健 on 23/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import "PasswordSettingViewController.h"

@implementation PasswordSettingViewController

-(void)viewDidLoad{
    _userDefault = [NSUserDefaults standardUserDefaults];
}

- (IBAction)confirmSetting:(UIButton *)sender {
    
    if (_passwordText.text.length != 0&& _passwordRepeat.text.length != 0
        &&[_passwordRepeat.text isEqualToString: _passwordText.text]) {
        
        [_userDefault setObject:_passwordText.text forKey:@"password"];
        
        [_delegate passwordDidSet];
        
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (IBAction)cancelButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

//点击View去除textfield焦点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_passwordText resignFirstResponder];
    [_passwordRepeat resignFirstResponder];
}
@end
