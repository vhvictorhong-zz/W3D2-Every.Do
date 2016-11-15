//
//  Todo.m
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString *)title andToDo:(NSString *)todoDescription andPriorityNumber:(NSInteger)priorityNumber andIsCompleted:(BOOL)isCompleted {
    
    if (self = [super init]) {
        
        _title = title;
        _todoDescription = todoDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
        
    }
    
    return self;
    
}

@end
