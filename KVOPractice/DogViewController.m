//
//  DogViewController.m
//  KVOPractice
//
//  Created by Steve Baker on 4/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "DogViewController.h"

@interface DogViewController ()

- (IBAction)feedTheDogTapped:(id)sender;
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

- (IBAction)feedTheDogTapped:(id)sender {
    self.dog.dateFed = [NSDate date];
    NSLog(@"DogViewController self.dog.dateFed %@", self.dog.dateFed);
}

- (IBAction)petTheDogTapped:(id)sender {
    // update model on background queue.
    // To avoid possible crash, KVO observer must get main queue before updating UI
    __weak typeof(self) weakSelf = self;
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        NSLog(@"DogViewController self.dog.datePetted %@", weakSelf.dog.datePetted);
        weakSelf.dog.datePetted = [NSDate date];
    }];
}

@end
