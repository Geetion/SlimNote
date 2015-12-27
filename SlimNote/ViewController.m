//
//  ViewController.m
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.function = [NSArray arrayWithObjects:@"remind",@"note",nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *title = [cell viewWithTag:1];
    title.text = @"123";
    printf("123");
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *vc = [myStoryBoard instantiateViewControllerWithIdentifier:@"remind"];
    [self.navigationController pushViewController:vc animated:true];
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
