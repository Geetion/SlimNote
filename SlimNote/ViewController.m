//
//  ViewController.m
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *listTableView;

@end

@implementation ViewController
NSMutableArray *_items;
NSUserDefaults *userDefault;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([userDefault objectForKey:@"cache"] != nil) {
        NSData *cacheData = [userDefault dataForKey:@"Cache"];
//        _items = [NSKeyedUnarchiver unarchiveObjectWithData:cacheData];
    }else{
        _items = [[NSMutableArray alloc]initWithCapacity:20];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]  isEqual: @"add"]){
        AddViewController *add = [segue destinationViewController];
        add.delegate = self;
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ListItem *item = _items[_items.count - 1 - indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ListItem *item = _items[indexPath.row];
    [item toggleCheked];
    [self configureCheckmarkForCell:cell atIndexPath:item];
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray* indexPaths = @[indexPath];
    [_items removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:true];
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(ListItem *)item{
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ListItem *)item{
    UILabel *label = [cell viewWithTag:1];
    label.text = item.title;
}

-(void)addItemToTableView:(NSString*)title{
    
    
    ListItem *item = [[ListItem alloc]init];
    item.title = title;
    item.checked = NO;
    [_items insertObject:item atIndex:0];
    
    [_listTableView reloadData];
    
    NSLog(@"numberOfRowsInSection: %d", [_listTableView numberOfRowsInSection:0]);
    
//    NSArray* index = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
//    [_listTableView insertRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationTop];
    
    NSData *cacheData = [NSKeyedArchiver archivedDataWithRootObject:item];
    [userDefault setObject:cacheData forKey:@"cache"];
    [userDefault synchronize];
}


@end
