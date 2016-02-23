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
}
- (IBAction)passwordSwitchDidChange:(UISwitch *)sender {
    if ([sender isOn]) {
        [_userDefault setBool:true forKey:@"passwordIsOn"];
    }else{
        [_userDefault setBool:false forKey:@"passwordIsOn"];
    }
    [_userDefault synchronize];
}
- (IBAction)touchIDSwitchDidChange:(UISwitch *)sender {
    if ([sender isOn]) {
        [_userDefault setBool:true forKey:@"touchIDisOn"];
    }else{
        [_userDefault setBool:false forKey:@"touchIDisOn"];
    }
    [_userDefault synchronize];
}
- (IBAction)confirmSetting:(UIButton *)sender {
    
    if (_passwordText.text.length != 0&& _passwordRepeat.text.length != 0&&
        _passwordRepeat == _passwordText) {
        [_userDefault setObject:_passwordText.text forKey:@"password"];
    }
}

@end
