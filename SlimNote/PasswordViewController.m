//
//  PasswordViewController.m
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import "PasswordViewController.h"

@implementation PasswordViewController

-(void)viewDidLoad{
    [self checkPassword];
}

-(void)checkPassword{
    
    LAContext *lacontext = [[LAContext alloc]init];
    NSError *error;
    
    if ([lacontext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [lacontext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:@"Touch Id Test"
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    
                                }else{
                                    
                                }
                            }];
    }
    else {
        
    }
}

@end
