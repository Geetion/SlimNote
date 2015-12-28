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
    NSMutableArray *_items;


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.function = [NSArray arrayWithObjects:@"remind",@"note",nil];
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    ListItem *item;
//    for (int i = 0; i < 5; i++) {
//        item.isChecked = TRUE;
//        item.title = @"ASDASDAD";
//        [_items addObject:item];
//    }
//    for (int i=0; i<5; i++) {
//        item.isChecked = false;
//        item.title = @"12312313";
//        [_items addObject:item];
    item = [[ListItem alloc]init];
    item.text =@"观看嫦娥飞天和玉兔升空的视频";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ListItem alloc]init];
    item.text =@"了解Sony a7和MBP的最新价格";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ListItem alloc]init];
    item.text =@"复习苍老师的经典视频教程";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ListItem alloc]init];
    item.text =@"去电影院看地心引力";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ListItem alloc]init];
    item.text =@"看西甲巴萨新败的比赛回放";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ListItem alloc]init];
    item.text =@"去香天下吃首相套餐";
    item.checked = NO;
    [_items addObject:item];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    printf("1111");
    ListItem *item = _items[indexPath.row];
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
    label.text = item.text;
}

@end
