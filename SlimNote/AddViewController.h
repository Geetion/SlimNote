//
//  RemindViewController.h
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol addItemDelegate <NSObject>

-(void)addItemToTableView:(NSString*)title;
@end

@interface AddViewController : UITableViewController
@property id<addItemDelegate> delegate;


@end
