//
//  TicTacToeTests.m
//  TicTacToeTests
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

#define max_cells 4 //Size of tic tac toe game board 4*4
#define x_filled [NSNumber numberWithInt:1] //To set if block is filled by X
#define o_filled [NSNumber numberWithInt:0]  //To set if block is filled by O
#define nothing_filled [NSNumber numberWithInt:-1]  //To set if block is not filled

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
            [arr addObject:nothing_filled];
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
    arrayToTest[0][max_cells-1] = x_filled;
    arrayToTest[0][0] = x_filled;
    arrayToTest[max_cells-1][0] = x_filled;
    arrayToTest[max_cells-1][max_cells-1] = x_filled;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
}

-(void)testTopHorizontal{
    [self resetArray];
    
    //TEST CASE FOR TOP HORIZONTAL
    arrayToTest[0][0] = x_filled;
    arrayToTest[0][1] = x_filled;
    arrayToTest[0][2] = x_filled;
    arrayToTest[0][3] = x_filled;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
}

-(void)testFirstVertical{
    [self resetArray];
    
    //TEST CASE FOR TOP VERTICAL
    arrayToTest[0][0] = x_filled;
    arrayToTest[1][0] = x_filled;
    arrayToTest[2][0] = x_filled;
    arrayToTest[3][0] = x_filled;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
}

-(void)testDiagonal{
    [self resetArray];
    
    //TEST CASE FOR TOP DIAGONAL
    arrayToTest[0][0] = x_filled;
    arrayToTest[1][1] = x_filled;
    arrayToTest[2][2] = x_filled;
    arrayToTest[3][3] = x_filled;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
}

-(void)testBox{
    [self resetArray];
    
    //TEST CASE FOR TOP BOX
    arrayToTest[0][0] = x_filled;
    arrayToTest[0][1] = x_filled;
    arrayToTest[1][0] = x_filled;
    arrayToTest[1][1] = x_filled;
    XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [self resetArray];
        
        //TEST CASE FOR TOP DIAGONAL
        arrayToTest[0][0] = x_filled;
        arrayToTest[1][1] = x_filled;
        arrayToTest[2][2] = x_filled;
        arrayToTest[3][3] = x_filled;
        XCTAssertTrue([vcObj checkWiningCombinations:arrayToTest forPlayer:1]);
    }];
}

@end
