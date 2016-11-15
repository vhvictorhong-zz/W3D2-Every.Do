//
//  Todo.h
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *todoDescription;
@property NSInteger priorityNumber;
@property BOOL isCompleted;
@property NSDate *deadlineDate;

-(instancetype)initWithTitle:(NSString *)title andToDo:(NSString *)todoDescription andPriorityNumber:(NSInteger)priorityNumber andIsCompleted:(BOOL)isCompleted andDeadlineDate:(NSDate *)deadlineDate;

@end
