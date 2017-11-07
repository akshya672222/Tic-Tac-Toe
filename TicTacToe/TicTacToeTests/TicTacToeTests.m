//
//  TicTacToeTests.m
//  TicTacToeTests
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

#define max_cells 4
#define YES_Value @"YES"
#define NO_Value @"NO"

@interface TicTacToeTests : XCTestCase

@end

@implementation TicTacToeTests{
    ViewController *vcObj;
    NSMutableArray *arrayToTest;
}

- (void)setUp {
    [super setUp];
    
    vcObj = [[ViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(void)resetArray{
    arrayToTest = nil;
    arrayToTest = [[NSMutableArray alloc] initWithCapacity:max_cells];
    for (int i = 0; i< max_cells; i++) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:max_cells];
        for (int j = 0; j < max_cells; j++) {
            [arr addObject:NO_Value];
        }
        [arrayToTest addObject:arr];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self resetArray];
    
    //TEST CASE FOR CORNER WIN CONDITION
    arrayToTest[0][max_cells-1] = YES_Value;
    arrayToTest[0][0] = YES_Value;
    arrayToTest[max_cells-1][0] = YES_Value;
    arrayToTest[max_cells-1][max_cells-1] = YES_Value;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
}

-(void)testTopHorizontal{
    [self resetArray];
    
    //TEST CASE FOR TOP HORIZONTAL
    arrayToTest[0][0] = YES_Value;
    arrayToTest[0][1] = YES_Value;
    arrayToTest[0][2] = YES_Value;
    arrayToTest[0][3] = YES_Value;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
}

-(void)testFirstVertical{
    [self resetArray];
    
    //TEST CASE FOR TOP VERTICAL
    arrayToTest[0][0] = YES_Value;
    arrayToTest[1][0] = YES_Value;
    arrayToTest[2][0] = YES_Value;
    arrayToTest[3][0] = YES_Value;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
}

-(void)testDiagonal{
    [self resetArray];
    
    //TEST CASE FOR TOP DIAGONAL
    arrayToTest[0][0] = YES_Value;
    arrayToTest[1][1] = YES_Value;
    arrayToTest[2][2] = YES_Value;
    arrayToTest[3][3] = YES_Value;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
}

-(void)testBox{
    [self resetArray];
    
    //TEST CASE FOR TOP BOX
    arrayToTest[0][0] = YES_Value;
    arrayToTest[0][1] = YES_Value;
    arrayToTest[1][0] = YES_Value;
    arrayToTest[1][1] = YES_Value;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [self resetArray];
        
        //TEST CASE FOR TOP DIAGONAL
        arrayToTest[0][0] = YES_Value;
        arrayToTest[1][1] = YES_Value;
        arrayToTest[2][2] = YES_Value;
        arrayToTest[3][3] = YES_Value;
        XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest]);
    }];
}

@end
