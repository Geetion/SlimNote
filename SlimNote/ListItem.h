//
//  ListItem.h
//  SlimNote
//
//  Created by Geetion on 15/12/28.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;

-(void)toggleCheked;
@end
