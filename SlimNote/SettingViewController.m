//
//  SettingViewController.m
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"

@implementation SettingViewController

-(void)loadView{
    [super loadView];
    
    _userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([_userDefault boolForKey:@"passwordIsOn"] == true) {
        _passwordSwitch.on = true;
    }else{
        _passwordSwitch.on = false;
    }
    
    if ([_userDefault boolForKey:@"touchIDisOn"] == true) {
        _touchIDSwitch.on = true;
    }else{
        _touchIDSwitch.on = false;
    }
}

- (IBAction)passwordSwitchDidChange:(UISwitch *)sender {
    
    if ([sender isOn]) {
        
        [_userDefault setBool:true forKey:@"passwordIsOn"];
        
    }else{
        
        [_userDefault setBool:false forKey:@"passwordIsOn"];
        
        [_touchIDSwitch setOn:false animated:true];
    }
    
    [_userDefault synchronize];
}

- (IBAction)touchIDSwitchDidChange:(UISwitch *)sender {
    
    if ([sender isOn]) {
        
        [_passwordSwitch setOn:true animated:true];
        
        [_userDefault setBool:true forKey:@"touchIDisOn"];
        
        [_userDefault setBool:true forKey:@"passwordIsOn"];
        
    }else{
        
        [_userDefault setBool:false forKey:@"touchIDisOn"];
    }
    
    [_userDefault synchronize];
}

- (IBAction)confirmSetting:(UIButton *)sender {
    
    if (_passwordText.text.length != 0&& _passwordRepeat.text.length != 0
        &&[_passwordRepeat.text isEqualToString: _passwordText.text]) {
        
        [_userDefault setObject:_passwordText.text forKey:@"password"];
        
        [[self navigationController] popViewControllerAnimated:true];
    }
}

//点击View去除textfield焦点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_passwordText resignFirstResponder];
    [_passwordRepeat resignFirstResponder];
}

@end
