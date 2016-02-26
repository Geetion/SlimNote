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

    [self loadData];
    
}

-(NSString*)documentsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

-(NSString*)dataFilePath{
    return [[self documentsDirectory]stringByAppendingPathComponent:@"Checklists.plist"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier]  isEqual: @"add"]){
        //1
        UINavigationController *navigationController = segue.destinationViewController;
        
        //2
        AddViewController *controller = (AddViewController*) navigationController.topViewController;
        
        //3
        controller.delegate = self;
    }
    
}

#pragma addViewControllerDelegate
-(void)addItemToTableView:(NSString*)title{
    
    
    ListItem *item = [[ListItem alloc]init];
    item.title = title;
    [listitems addObject:item];
    
    NSArray* index = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    [_listTableView insertRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationAutomatic];
    [[self tableView] reloadData];
    
    [self saveData];
}

#pragma save&load data
-(void)saveData{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:listitems forKey:@"ChecklistItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

-(void)loadData{
    
    NSString *path =[self dataFilePath];
    
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        NSData *data = [[NSData alloc]initWithContentsOfFile:path ];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        listitems = [unarchiver decodeObjectForKey:@"ChecklistItems"];
        [unarchiver finishDecoding];
        
        [self.tableView reloadData];
    }else{
        listitems = [[NSMutableArray alloc]initWithCapacity:20];
    }
}


#pragma tableView delegate&datasource
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


@end
