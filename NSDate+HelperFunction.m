//
//  NSDate+HelperFunction.m
//  Every.Do
//
//  Created by Victor Hong on 15/11/2016.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

#import "NSDate+HelperFunction.h"

@implementation NSDate (HelperFunction)

+(NSString *)stringFromDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"MM/dd/yyyy hh:mm"];
    
    return [dateFormat stringFromDate:date];
    
}

@end
