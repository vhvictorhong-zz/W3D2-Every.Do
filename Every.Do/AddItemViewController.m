//
//  AddItemViewController.m
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "AddItemViewController.h"
#import "MasterViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *todoTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property BOOL isCompletedSwitch;

@property Todo *addNewObject;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isCompletedSwitch = YES;
    
}

- (IBAction)switchToggled:(UISwitch *)sender {
    
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        self.isCompletedSwitch = YES;
    } else {
        self.isCompletedSwitch = NO;
    }
    
}

- (IBAction)insertObjectButton:(UIButton *)sender {
    
    self.addNewObject = [[Todo alloc] initWithTitle:self.titleTextField.text andToDo:self.todoTextField.text andPriorityNumber:[self.priorityTextField.text integerValue] andIsCompleted:self.isCompletedSwitch];
    
    [self.todoObject addObject:self.addNewObject];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
