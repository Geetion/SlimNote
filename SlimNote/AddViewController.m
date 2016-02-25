//
//  RemindViewController.m
//  SlimNote
//
//  Created by Geetion on 15/12/27.
//  Copyright © 2015年 Geetion. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@end
@implementation AddViewController

- (IBAction)dateSwitch:(UISwitch *)sender {
    
    NSArray* index = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:2 inSection:0]];
    
    if ([sender state]) {
        [[self tableView] deleteRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        [[self tableView] insertRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)confirmButton:(id)sender {
    
    NSString *title = [_titleTextField text];
    
    if (title.length != 0){
        
        [_delegate addItemToTableView:title];
        
        printf("222");
        
        [self dismissViewControllerAnimated:true completion:nil];
    }
    
}
//- (IBAction)confirmButton:(UIButton *)sender {
//}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_titleTextField resignFirstResponder];
}

#pragma tableView delegate&datasource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
