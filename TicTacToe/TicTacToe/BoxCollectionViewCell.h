//
//  BoxCollectionViewCell.h
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *viewBorder;
@property (assign, nonatomic) BOOL isSelected;

@end
