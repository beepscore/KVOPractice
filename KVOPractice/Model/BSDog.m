//
//  BSDog.m
//  KVOPractice
//
//  Created by Steve Baker on 4/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSDog.h"

@implementation BSDog

// override implicitly synthesized setter to send KVO notifications
// Don't need to do this because NSDate is KVO compliant.
// By default uses property name as the key string.
// - (void)setDatePetted:(NSDate *)aDate {
//
//     KVO send notification
//     [self willChangeValueForKey:@"datePetted"];
//
//     set instance variable
//     _datePetted = aDate;
//
//     KVO send notification
//     [self didChangeValueForKey:@"datePetted"];
// }

@end