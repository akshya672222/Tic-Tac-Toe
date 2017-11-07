//
//  CollectionViewHolderTableViewCell.h
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxCollectionView: UICollectionView

@property (strong, nonatomic) NSIndexPath *index;

@end

@interface CollectionViewHolderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet BoxCollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSIndexPath*)index;

@end
