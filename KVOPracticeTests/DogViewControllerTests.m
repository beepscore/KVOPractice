//
//  DogViewControllerTests.m
//  KVOPractice
//
//  Created by Steve Baker on 4/14/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DogViewController.h"
#import "DogViewControllerPrivate.h"

@interface DogViewControllerTests : XCTestCase

@property (strong, nonatomic) DogViewController *dogViewController;

@end

@implementation DogViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFeedTheDogTappedSetsDateFed {
    self.dogViewController = [[DogViewController alloc] init];
    self.dogViewController.dog = [[BSDog alloc] init];
    XCTAssertNil(self.dogViewController.dog.dateFed);

    [self.dogViewController feedTheDogTapped:self];

    NSDate *actualDate = self.dogViewController.dog.dateFed;
    XCTAssertNotNil(actualDate);

    NSDate *testDate = [NSDate date];
    float testDateMinusActualDateSeconds = [testDate
                                     timeIntervalSinceDate:self.dogViewController.dog.dateFed];
    XCTAssert(testDateMinusActualDateSeconds < 2.0);
}

@end
