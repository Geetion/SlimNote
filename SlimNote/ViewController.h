//
//  ViewController.h
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"
#import "AddViewController.h"

@interface ViewController : UITableViewController<addItemDelegate>
@property (readonly, strong, nonatomic) NSUserDefaults* userDefault;
@end

