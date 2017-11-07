//
//  CollectionViewHolderTableViewCell.m
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import "CollectionViewHolderTableViewCell.h"

@implementation BoxCollectionView

@end

@implementation CollectionViewHolderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource,UICollectionViewDelegate>)dataSourceDelegate index:(NSIndexPath*)index{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.index = index;
    [self.collectionView reloadData];
}

@end
