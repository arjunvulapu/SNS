//
//  RentVC.h
//  SNS
//
//  Created by Apple on 26/02/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface RentVC : BaseViewController
- (IBAction)backBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UICollectionView *topCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *saleBtn;
- (IBAction)saleBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *sellLbl;
@property (weak, nonatomic) IBOutlet UILabel *rentLbl;
@property (weak, nonatomic) IBOutlet UIButton *rentBtn;
- (IBAction)rentBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *saleArrowImage;
@property (weak, nonatomic) IBOutlet UIImageView *rentArrowImage;
@property (weak, nonatomic) IBOutlet UIView *saleBgView;
@property (weak, nonatomic) IBOutlet UIView *rentBgView;

@end

NS_ASSUME_NONNULL_END
