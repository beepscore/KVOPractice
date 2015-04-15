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
                                     timeIntervalSinceDate:actualDate];
    XCTAssert(testDateMinusActualDateSeconds < 2.0);
}

- (void)testUpdateDatePettedInBackgroundAsync {
    // synchronous test fails, probably because petTheDogTapped uses background thread
    // Use an asynchronous test to give it time to pass
    // Reference Apple XCTestCase+AsynchronousTesting.h
    // http://astralbodi.es/2014/08/06/asynchronous-unit-testing-core-data-with-xcode-6/
    // http://www.pumpmybicep.com/2014/08/20/asynchronous-unit-testing-with-xctest/
    // http://iosunittesting.com/asynchronous-tests-using-xctestexpectation/
    // http://nshipster.com/xctestcase/
    // http://blog.dadabeatnik.com/2014/07/13/asynchronous-unit-testing-in-xcode-6/#more-1114
    // https://www.bignerdranch.com/blog/asynchronous-testing-with-xcode-6/
    // http://stackoverflow.com/questions/27555499/xctestexpectation-how-to-avoid-calling-the-fulfill-method-after-the-wait-contex

    self.dogViewController = [[DogViewController alloc] init];
    self.dogViewController.dog = [[BSDog alloc] init];

    //XCTAssertNil(self.dogViewController.dog.datePetted);

    // Currently can't use this expectation because can't know expectedValue
    // XCTestExpectation *expectation = [self
    //                                  keyValueObservingExpectationForObject:self.dogViewController.dog
    //                                  keyPath:@"datePetted"
    //                                  expectedValue:[NSDate date]];

    __weak XCTestExpectation *expectation =
    // handler gets called whenever observedObject value at keyPath changes
    [self keyValueObservingExpectationForObject:self.dogViewController.dog
                                        keyPath:@"datePetted"
                                        handler:^(id observedObject, NSDictionary *change) {

                                            // Don't use observedObject, I think it
                                            // led to exception below.
                                            // BSDog* dog = (BSDog*)observedObject;
                                            // if (dog && dog.datePetted) {
                                            if (self.dogViewController.dog
                                                && self.dogViewController.dog.datePetted) {
                                                NSDate *actualDate = self.dogViewController.dog.datePetted;
                                                XCTAssertNotNil(actualDate);
                                                
                                                NSDate *testDate = [NSDate date];
                                                float testDateMinusActualDateSeconds = [testDate
                                                                                        timeIntervalSinceDate:actualDate];
                                                XCTAssert(testDateMinusActualDateSeconds < 2.0);
                                                [expectation fulfill];
                                                return YES;
                                            } else {
                                                XCTAssertNotNil(self.dogViewController.dog.datePetted);
                                                [expectation fulfill];
                                                return NO;
                                            }
                                        }];

    // while running tests, saw exception
    // testUpdateDatePettedInBackgroundAsync] : failed: caught "NSRangeException",
    // "Cannot remove an observer <_XCKVOExpectation 0x17067fd00> for the key path "datePetted" from <BSDog 0x174222200> because it is not registered as an observer."

    [self.dogViewController updateDatePettedInBackground];

    [self waitForExpectationsWithTimeout:5.0
                                 handler:^(NSError *error) {
                                     if (error) {
                                         NSLog(@"Timeout Error: %@", error);
                                     }
                                 }];
}

@end
