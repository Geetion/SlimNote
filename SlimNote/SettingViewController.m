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
    
    if ([_userDefault boolForKey:@"passwordSwitch"]) {
        _passwordSwitch.on = true;
    }else{
        _passwordSwitch.on = false;
    }
}
- (IBAction)passwordSwitchDidChange:(UISwitch *)sender {
    if ([sender state]) {
        [_userDefault setBool:false forKey:@"passwordSwitch"];
    }else{
        [_userDefault setBool:true forKey:@"passwordSwitch"];
    }
}

@end
