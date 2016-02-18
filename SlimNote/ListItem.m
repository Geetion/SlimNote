//
//  ListItem.m
//  SlimNote
//
//  Created by Geetion on 15/12/28.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

-(void)toggleCheked{
    self.checked = !self.checked;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    [aDecoder decodeBoolForKey:@"checked"];
    [aDecoder decodeObjectForKey:@"title"];
    
    return [super init];
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeBool:self.checked forKey:@"checked"];
    [aCoder encodeObject:self.title forKey:@"title"];
}
@end
