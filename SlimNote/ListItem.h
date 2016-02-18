//
//  ListItem.h
//  SlimNote
//
//  Created by Geetion on 15/12/28.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject<NSCoding>
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)BOOL checked;

-(void)toggleCheked;
@end
