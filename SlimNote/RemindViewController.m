//
//  RemindViewController.m
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import "RemindViewController.h"
@interface RemindViewController()
@end
@implementation RemindViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
