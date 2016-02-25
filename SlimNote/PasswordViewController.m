//
//  PasswordViewController.m
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import "PasswordViewController.h"
#import "ViewController.h"

@implementation PasswordViewController

-(void)viewDidLoad{
    
    _userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([_userDefault boolForKey:@"touchIDisOn"] == true ) {
            [self checkTouchID];
    }else{

        _touchIDButtonOutlet.alpha = 0;
    }
}

-(void)checkTouchID{
    
    LAContext *lacontext = [[LAContext alloc]init];
    NSError *error;
    
    if ([lacontext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [lacontext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:@"请验证指纹"
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    [self signIn];
                                }else{
                                    
                                }
                            }];
    }
    else {
        
    }
}

-(void)signIn{
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navigation = [myStoryBoard instantiateViewControllerWithIdentifier:@"rootView"];
    [self presentViewController:navigation animated:TRUE completion:nil];
}

- (IBAction)confirmButton:(UIButton *)sender {
    
    if (_passwordInput.text.length!=0) {
        NSString *password = [_userDefault objectForKey:@"password"];
        if ( [_passwordInput.text isEqualToString: password]) {
            [self signIn];
        }
    }
}
- (IBAction)touchIDButton:(UIButton *)sender {
    [self checkTouchID];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_passwordInput resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self confirmButton:nil];
    return true;
}

@end
