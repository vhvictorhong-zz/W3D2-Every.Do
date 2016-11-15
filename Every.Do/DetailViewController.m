//
//  DetailViewController.m
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.detailDescriptionLabel.text = self.detailObject.todoDescription;
    
}



@end
