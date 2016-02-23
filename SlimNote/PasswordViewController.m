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
    [self checkPassword];
}

-(void)checkPassword{
    
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
    
    NSString password = 
}

@end
