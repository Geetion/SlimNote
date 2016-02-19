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

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)confirmButton:(UIButton *)sender {
    
    NSString *title = [_titleTextField text];
    
    NSLog(@"111%d",title.length);
    
    if (title.length != 0){
        
        [_delegate addItemToTableView:title];
        
        [self dismissViewControllerAnimated:true completion:nil];
    }
    
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_titleTextField resignFirstResponder];
}
@end
