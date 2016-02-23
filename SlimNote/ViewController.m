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


NSMutableArray *listitems;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userDefault = [NSUserDefaults standardUserDefaults];
    
    listitems = [[NSMutableArray alloc]initWithCapacity:20];
    
    if ([_userDefault objectForKey:@"cache"] != NULL) {
        NSData *cacheData = [_userDefault dataForKey:@"cache"];
       listitems = [NSKeyedUnarchiver unarchiveObjectWithData:cacheData];
        for (ListItem *item in listitems) {
            NSLog(@"%@",item.title);
        }
    }else{
    }
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]  isEqual: @"add"]){
        AddViewController *add = [segue destinationViewController];
        add.delegate = self;
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listitems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ListItem *item = listitems[indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell atIndexPath:item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ListItem *item = listitems[indexPath.row];
    NSLog(@"%d",item.checked);
    [item toggleCheked];
    [self configureCheckmarkForCell:cell atIndexPath:item];
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self saveData];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray* indexPaths = @[indexPath];
    [listitems removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:true];
    [self saveData];
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
    [listitems addObject:item];
    
    
    
    NSArray* index = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    [_listTableView insertRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [[self tableView] reloadData];
    
    [self saveData];
}

-(void)saveData{
    NSData *cacheData = [NSKeyedArchiver archivedDataWithRootObject: listitems];
    [_userDefault setObject:cacheData forKey:@"cache"];
    [_userDefault synchronize];
}


@end
