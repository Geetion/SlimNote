//
//  PasswordViewController.h
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface PasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (readonly, strong, nonatomic) NSUserDefaults* userDefault;

@end
