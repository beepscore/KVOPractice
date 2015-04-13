//
//  StatusViewController.m
//  KVOPractice
//
//  Created by Steve Baker on 4/11/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "StatusViewController.h"
#import "BSDog.h"
#import "DogViewController.h"
#import "BSKVOConstants.h"

@interface StatusViewController ()

@property (strong, nonatomic) BSDog *dog;

@property (weak, nonatomic) IBOutlet UILabel *lastFedLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastPettedLabel;

@end

@implementation StatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dog = [[BSDog alloc] init];
    [self addKVOObservers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    // KVO stop observing dog
    [self.dog removeObserver:self forKeyPath:kDogDateFedKey];
    [self.dog removeObserver:self forKeyPath:kDogDatePettedKey];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DogViewController *dogViewController = [segue destinationViewController];
    dogViewController.dog = self.dog;
}

// Use unwind segue. It's very flexible.
// In storyboard, another view controller's exit unwind segue
// can call this view controller's IBAction method
// http://stackoverflow.com/questions/12561735/what-are-unwind-segues-for-and-how-do-you-use-them
- (IBAction)unwindToStatusViewControllerViaSegue:(UIStoryboardSegue *)unwindSegue {

    if ([unwindSegue.identifier isEqualToString:@"unwindDogToStatusSegue"]) { NSLog(@"unwindDogToStatusSegue");
    }
}

#pragma mark - KVO
// NOTE: Probably would be simpler to read self.dog.datePetted instead of KVO
// This project is designed to practice using KVO.

- (void)addKVOObservers {
    [self.dog addObserver:self
               forKeyPath:kDogDateFedKey
                  options:(NSKeyValueObservingOptionNew)
                  context:nil];

    [self.dog addObserver:self
               forKeyPath:kDogDatePettedKey
                  options:(NSKeyValueObservingOptionNew)
                  context:nil];
}

// KVO uses this single callback method for all object change notifications
- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context {

    if ([keyPath isEqualToString:kDogDateFedKey]) {
        // assumes object is dog
        NSDate *dateFedFromKVO = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"StatusViewController dateFedFromKVO %@", dateFedFromKVO);
        self.lastFedLabel.text = [dateFedFromKVO
                                  descriptionWithLocale:[NSLocale currentLocale]];
    }

    else if ([keyPath isEqualToString:kDogDatePettedKey]) {
        // assumes object is dog
        NSDate *datePettedFromKVO = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"StatusViewController datePettedFromKVO %@", datePettedFromKVO);
        self.lastPettedLabel.text = [datePettedFromKVO
                                     descriptionWithLocale:[NSLocale currentLocale]];
    }

    else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

@end
