//
//  DogViewControllerPrivate.h
//  KVOPractice
//
//  Created by Steve Baker on 4/14/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//
//  These methods are "private", for internal use by class and by unit tests.

#import "DogViewController.h"

@interface DogViewController ()

- (IBAction)feedTheDogTapped:(id)sender;
- (IBAction)petTheDogTapped:(id)sender;
- (void)updateDatePettedInBackground;

@end
