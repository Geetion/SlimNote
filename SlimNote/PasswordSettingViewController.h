//
//  PasswordSettingViewController.h
//  SlimNote
//
//  Created by 胡健 on 23/02/2016.
//  Copyright © 2016 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PasswordSettingDelegate <NSObject>

-(void)passwordDidSet;

@end

@interface PasswordSettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *passwordRepeat;
@property (readonly, strong, nonatomic) NSUserDefaults* userDefault;
@property id<PasswordSettingDelegate> delegate;
@end
