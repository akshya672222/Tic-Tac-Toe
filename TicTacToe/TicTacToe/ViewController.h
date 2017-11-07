//
//  ViewController.h
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(BOOL)checkWiningCombinations:(NSMutableArray *)checkArray;

@end

