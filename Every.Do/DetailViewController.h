//
//  DetailViewController.h
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property NSString *detailText;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

