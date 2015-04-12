//
//  StatusViewController.m
//  KVOPractice
//
//  Created by Steve Baker on 4/11/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "StatusViewController.h"
#import "DogViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DogViewController *dogViewController = [segue destinationViewController];
    dogViewController.dog = [[BSDog alloc] init];
}

// Use unwind segue. It's very flexible.
// In storyboard, another view controller's exit unwind segue
// can call this view controller's IBAction method
// http://stackoverflow.com/questions/12561735/what-are-unwind-segues-for-and-how-do-you-use-them
- (IBAction)unwindToStatusViewControllerViaSegue:(UIStoryboardSegue *)unwindSegue {

    if ([unwindSegue.identifier isEqualToString:@"unwindDogToStatusSegue"]) { NSLog(@"unwindDogToStatusSegue");
    }
}

@end
