//
//  MasterViewController.m
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "AddItemViewController.h"
#import "Todo.h"
#import "NSDate+HelperFunction.h"

@interface MasterViewController ()

@property NSString *segueIdentifier;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performSegue)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.segueIdentifier = @"modalSegue";
    
    Todo *todoListOne = [[Todo alloc] initWithTitle:@"Clean" andToDo:@"Clean up the bedroom" andPriorityNumber:2 andIsCompleted:NO andDeadlineDate:[NSDate date]];
    Todo *todoListTwo = [[Todo alloc] initWithTitle:@"Movie" andToDo:@"Watch doctor strange on tuesday" andPriorityNumber:1 andIsCompleted:NO andDeadlineDate:[NSDate date]];
    Todo *todoListThree = [[Todo alloc] initWithTitle:@"Lighthouse Labs" andToDo:@"Go to class" andPriorityNumber:1 andIsCompleted:YES andDeadlineDate:[NSDate date]];
    
    self.objects = [[NSMutableArray alloc] init];
    
    [self.objects addObject:todoListOne];
    [self.objects addObject:todoListTwo];
    [self.objects addObject:todoListThree];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(crossItemOff:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeRight];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    //FIX THIS
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.detailObject = object;
        
    } else if ([[segue identifier] isEqualToString:self.segueIdentifier]) {
        
        AddItemViewController *controller = (AddItemViewController *)[segue destinationViewController];
        controller.todoObject = self.objects;
        
    }
}

-(void)performSegue {
    
    [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
    
    if (object.isCompleted) {
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:object.title];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        
        cell.titleLabel.attributedText = attributeString;
        cell.descriptionLabel.text = object.todoDescription;
        cell.priorityLabel.text = [NSString stringWithFormat:@"Priority : %ld", (long)object.priorityNumber];
        cell.deadlineLabel.text = [NSString stringWithFormat:@"Deadline : %@", [NSDate stringFromDate:object.deadlineDate]];
        
    } else {
        
        cell.titleLabel.text = object.title;
        cell.descriptionLabel.text = object.todoDescription;
        cell.priorityLabel.text = [NSString stringWithFormat:@"Priority : %ld", (long)object.priorityNumber];
        cell.deadlineLabel.text = [NSString stringWithFormat:@"Deadline : %@", [NSDate stringFromDate:object.deadlineDate]];
        
    }
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//Make tableview move

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    if (sourceIndexPath != destinationIndexPath ) {
        
        [self.objects removeObjectAtIndex:sourceIndexPath.row];
        [self.objects insertObject:self.objects atIndex:destinationIndexPath.row];
        
    }
    
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}

#pragma mark - Master VC methods

-(void)crossItemOff:(UISwipeGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:location];
    
    Todo *object = self.objects[swipedIndexPath.row];
    
    object.isCompleted = YES;
    
    [self.tableView reloadData];
    
}

@end
