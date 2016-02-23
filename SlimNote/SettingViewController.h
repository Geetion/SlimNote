//
//  SettingViewController.h
//  SlimNote
//
//  Created by 胡健 on 22/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordSettingViewController.h"

@interface SettingViewController : UITableViewController<PasswordSettingDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *passwordSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *touchIDSwitch;
@property (readonly, strong, nonatomic) NSUserDefaults* userDefault;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *passwordRepeat;

@end
