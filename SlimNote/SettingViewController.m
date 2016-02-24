//
//  SettingViewController.m
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"
#import <LocalAuthentication/LocalAuthentication.h>

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
        
        [self setPassword];
        
    }else{
        
        [_userDefault setBool:false forKey:@"passwordIsOn"];
        
        [_userDefault removeObjectForKey:@"password"];
        
        [_touchIDSwitch setOn:false animated:true];
    }

    [_userDefault synchronize];
}

- (IBAction)touchIDSwitchDidChange:(UISwitch *)sender {
    
    if ([sender isOn]) {
        
        [_passwordSwitch setOn:true animated:true];
        
        [_userDefault setBool:true forKey:@"touchIDisOn"];
        
        if([_userDefault objectForKey:@"password"] == nil){
            [self setPassword];
        }
        
    }else{
        
        [_userDefault setBool:false forKey:@"touchIDisOn"];
    }
    
    [_userDefault synchronize];
}

-(void)checkTouchIDSupport{
    LAContext *lacontext = [[LAContext alloc]init];
    NSError *error;
    
    if ([lacontext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]==true) {
            [_userDefault setBool:true forKey:@"touchIDisOn"];
    }
    else {
        [_touchIDSwitch setOn:false animated:true];
    }
}

-(void)setPassword{
    UIStoryboard *myStoryBoard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil ];
    UINavigationController *navigation = [myStoryBoard instantiateViewControllerWithIdentifier:@"passwordSetting"];
    
    PasswordSettingViewController *viewController = [navigation topViewController];
    
    viewController.delegate = self;
    
    [self presentViewController:navigation animated:true completion:nil];
}

#pragma PasswordSettingDelegate
-(void)passwordDidSet{
    
    [_userDefault setBool:true forKey:@"passwordIsOn"];
    
    [_passwordSwitch setOn:true animated:true];
}

#pragma tableView delegate&datasource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([indexPath section]) {
        
        switch ([indexPath row]) {
            case 0:
                
                break;
            default:
                break;
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
