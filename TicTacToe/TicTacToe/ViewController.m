//
//  ViewController.m
//  TicTacToe
//
//  Created by AKSHAY SUNDERWANI on 06/11/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

#import "ViewController.h"
#import "GlobalFunctions.h"
#import "CollectionViewHolderTableViewCell.h"
#import "BoxCollectionViewCell.h"

#define max_cells 4
#define YES_Value @"YES"
#define NO_Value @"NO"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewTopBar;
@property (weak, nonatomic) IBOutlet UITableView *tableViewGame;
@property (weak, nonatomic) IBOutlet UIButton *btnNewGame;
- (IBAction)startNewGame:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewWidth;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCurrentPlayer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewBottom;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController{
    bool switchUser;
    UIImage *xImage;
    UIImage *oImage;
    UIImage *xImageResized;
    UIImage *oImageResized;
    NSInteger numberOfRounds;
    NSMutableArray *arrayUserX;
    NSMutableArray *arrayUserO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GlobalFunctions shared] createShadowOnView:_viewTopBar color:[UIColor grayColor] width:0.0 height:3.0 shadowOpacity:1.0 andShadowRadius:3.0];
    [[GlobalFunctions shared] createRoundCornerToView:self.btnNewGame cornerRadius:3.0];
    
    numberOfRounds = 0;
    xImage = [UIImage imageNamed:@"X"];
    oImage = [UIImage imageNamed:@"O"];
    xImageResized = [[GlobalFunctions shared] imageWithImage:xImage scaledToSize: CGSizeMake(60, 60)];
    oImageResized = [[GlobalFunctions shared] imageWithImage:oImage scaledToSize: CGSizeMake(60, 60)];

    [self hideAlert];
    
    [self setupArray];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setupArray{
    arrayUserX = nil;
    arrayUserO = nil;
    arrayUserX = [[NSMutableArray alloc] initWithCapacity:max_cells];
    arrayUserO = [[NSMutableArray alloc] initWithCapacity:max_cells];
    for(int i = 0; i< max_cells; i++){
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:max_cells];
        NSMutableArray *arr2 = [[NSMutableArray alloc] initWithCapacity:max_cells];
        for (int j = 0; j < max_cells; j++) {
            [arr addObject:NO_Value];
            [arr2 addObject:NO_Value];
        }
        [arrayUserX addObject:arr];
        [arrayUserO addObject:arr2];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //ADJUST TABLE VIEW TO MAKE IT SQUARE
    [self.view layoutIfNeeded];
    float expectedWidth = self.view.frame.size.width - 60;
    float height = _tableViewGame.frame.size.height;
    if(height < expectedWidth){
        _constraintTableViewWidth.constant = _tableViewGame.frame.size.height;
    }else{
        float difference = height - expectedWidth;
        float addingDifference = difference/2;
        _constraintTableViewTop.constant = _constraintTableViewTop.constant + addingDifference;
        _constraintTableViewBottom.constant = _constraintTableViewBottom.constant + addingDifference;
        [self.view layoutIfNeeded];
        _constraintTableViewWidth.constant = height;
    }
    [self.view layoutIfNeeded];
    [_tableViewGame reloadData];
    
    //SET INITIAL IMAGE AT CURRENT PLAYER
    switchUser = false;
    _imageViewCurrentPlayer.image = xImageResized;

}


#pragma mark - TABLE VIEW DELEGATES AND DATASOURCE
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return max_cells;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collectionCell";
    CollectionViewHolderTableViewCell *cell = (CollectionViewHolderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[CollectionViewHolderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(CollectionViewHolderTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell setCollectionViewDataSourceDelegate:self index:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"table view tapped...");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/max_cells;
}

#pragma mark - COLLECTION VIEW DELEGATES AND DATASOURCE
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return max_cells;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"boxCell";
    BoxCollectionViewCell *cell = (BoxCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[BoxCollectionViewCell alloc] init];
    }
    cell.imageView.image = nil;
    [[GlobalFunctions shared] addborderTo:cell.viewBorder withColor:[UIColor lightGrayColor] andWidth:1.0];
    
    return cell;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"collection view cell receieved the tap at ==== %ld and row = %ld", (long)indexPath.row, [(BoxCollectionView *)collectionView index].row);
    BoxCollectionViewCell *cell = (BoxCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.imageView.image == nil){
        if(!switchUser){
            cell.imageView.image = xImage;
            switchUser = true;
            arrayUserX[[(BoxCollectionView *)collectionView index].row][indexPath.row] = YES_Value;
            _imageViewCurrentPlayer.image = oImageResized;
        }else{
            cell.imageView.image = oImage;
            switchUser = false;
            arrayUserO[[(BoxCollectionView *)collectionView index].row][indexPath.row] = YES_Value;
            _imageViewCurrentPlayer.image = xImageResized;
        }
        numberOfRounds = numberOfRounds + 1;
        if (numberOfRounds >= ((max_cells*2)-1) && numberOfRounds <= (max_cells*max_cells)){
            if (switchUser) {
                if ([self checkWiningCombinations:arrayUserX]) {
                    [self showAlert:@"Player X Won!!"];
                }else{
                    if (numberOfRounds == (max_cells * max_cells)) {
                        [self showAlert:@"DRAW!!"];
                    }
                }
            }else{
                if ([self checkWiningCombinations:arrayUserO]) {
                    [self showAlert:@"Player O Won!!"];
                }else{
                    if (numberOfRounds == (max_cells * max_cells)) {
                        [self showAlert:@"DRAW!!"];
                    }
                }
            }
        }
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(self.tableViewGame.frame.size.width/max_cells, self.tableViewGame.frame.size.height/max_cells);
    return size;
}


#pragma mark - DID RECEIVE MEMORY WARNING
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - START NEW GAME
- (IBAction)startNewGame:(id)sender {
    switchUser = false;
    _imageViewCurrentPlayer.image = xImageResized;
    [self setupArray];
    [self hideAlert];
    numberOfRounds = 0;
    [self.tableViewGame reloadData];
}

#pragma mark - GAME WIN CHECK
-(BOOL)checkWiningCombinations:(NSMutableArray *)checkArray{

    //FLAGS TO KEEP TRACK OF PREVIOUS POSITION
    bool isHorizontalWin = false;
    bool isDiagonal1Win = false;
    bool isDiagonal2Win = false;
    bool is2x2BoxWin = false;

    //ARRAY TO CHECK FOR VERTICAL WIN
    NSMutableArray *tempArrIndex = [[NSMutableArray alloc] init];
    
    //CHECK FOR CORNER WIN
    if ([checkArray[0][0] isEqualToString:YES_Value] && [checkArray[0][max_cells-1] isEqualToString:YES_Value] && [checkArray[max_cells-1][0] isEqualToString:YES_Value] && [checkArray[max_cells-1][max_cells-1] isEqualToString:YES_Value]) {
        return true;
    }
    
    for (int i = 0; i < max_cells; i++) {
        if (isHorizontalWin) {
            break;
        }
        if (is2x2BoxWin) {
            break;
        }
        isHorizontalWin = false;
        for (int j = 0; j < max_cells; j++) {
            //CHECK FOR VERTICAL WIN
            if (i == 0) {
                if ([checkArray[i][j] isEqualToString:YES_Value]) {
                    [tempArrIndex addObject:[NSNumber numberWithInt:j]];
                }
            }else{
                if([tempArrIndex containsObject:[NSNumber numberWithInt:j]]){
                    if (!([checkArray[i][j] isEqualToString:YES_Value])) {
                        [tempArrIndex removeObject:[NSNumber numberWithInt:j]];
                    }
                }
            }
            
            //CHECK FOR HORIZONTAL WIN
            if (j == 0) {
                if ([checkArray[i][j] isEqualToString:YES_Value]) {
                    isHorizontalWin = true;
                }else{
                    isHorizontalWin = false;
                }
            }else{
                if ([checkArray[i][j] isEqualToString:YES_Value] && isHorizontalWin) {
                    isHorizontalWin = true;
                }else{
                    isHorizontalWin = false;
                }
                if (j == max_cells - 1 && isHorizontalWin) {
                    break;
                }
            }
            
            
            //CHECK FOR DIAGONAL WIN
            if(i == j){
                if (i == 0 && j == 0) {
                    if ([checkArray[i][j] isEqualToString:YES_Value]) {
                        isDiagonal1Win = true;
                    }
                }else{
                    if ([checkArray[i][j] isEqualToString:YES_Value] && isDiagonal1Win) {
                        isDiagonal1Win = true;
                    }else{
                        isDiagonal1Win = false;
                    }
                }
            }else{
                if (j == (max_cells-1)-i){
                    if (i == 0) {
                        if ([checkArray[i][j] isEqualToString:YES_Value]) {
                            isDiagonal2Win = true;
                        }
                    }else{
                        if ([checkArray[i][j] isEqualToString:YES_Value] && isDiagonal2Win) {
                            isDiagonal2Win = true;
                        }else{
                            isDiagonal2Win = false;
                        }
                    }
                }
            }
            
            //CHECK FOR BOX CONDITON
            if (i < max_cells - 1 && j < max_cells - 1) {
                if ([checkArray[i][j] isEqualToString:YES_Value] && [checkArray[i][j+1] isEqualToString:YES_Value] && [checkArray[i+1][j] isEqualToString:YES_Value] && [checkArray[i+1][j+1] isEqualToString:YES_Value]) {
                    is2x2BoxWin = true;
                    break;
                }
            }
        }
    }
    
    if (isDiagonal1Win || isDiagonal2Win || isHorizontalWin || is2x2BoxWin || tempArrIndex.count > 0) {
        return true;
    }
    
    return false;
}

-(void)showAlert:(NSString *)message{
    _messageLabel.text = message;
    _messageLabel.hidden = false;
    _backgroundView.hidden = false;
}

-(void)hideAlert{
    _messageLabel.hidden = true;
    _backgroundView.hidden = true;
}

@end
