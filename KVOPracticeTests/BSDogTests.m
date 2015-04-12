//
//  DogTests.m
//  KVOPracticeTests
//
//  Created by Steve Baker on 4/11/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BSDog.h"

@interface BSDogTests : XCTestCase

@end

@implementation BSDogTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDatePetted {

    BSDog *dog = [[BSDog alloc] init];

    XCTAssertNil(dog.datePetted);
    dog.datePetted = [NSDate date];
    XCTAssertNotNil(dog.datePetted);
}

@end
