//
//  DogViewController.m
//  KVOPractice
//
//  Created by Steve Baker on 4/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "DogViewController.h"

@interface DogViewController ()

- (IBAction)petTheDogTapped:(id)sender;

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)petTheDogTapped:(id)sender {
    self.dog.datePetted = [NSDate date];
    NSLog(@"self.dog.datePetted %@", self.dog.datePetted);
}

@end
