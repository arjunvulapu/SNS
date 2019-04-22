//
//  PostedBy2AVC.h
//  SNS
//
//  Created by Apple on 03/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "TTRangeSlider.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostedBy2AVC : BaseViewController<TTRangeSliderDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *genderCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *bathroomsCollectionView;
@property (weak, nonatomic) IBOutlet TTRangeSlider *totalAreaView;
@property (weak, nonatomic) IBOutlet UICollectionView *bikeParkingCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *furnishedCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *securitydepositCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *genderCollectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bathroomsCollectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bikeParkingCollectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *furnishedCollectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *securitydepositCollectionViewHeight;
@property (strong, nonatomic)  NSString *areamin;
@property (strong, nonatomic)  NSString *areamax;
@property (strong, nonatomic)  NSString *budgetmax;
@property (strong, nonatomic)  NSString *budgetmin;
//@property (weak, nonatomic) IBOutlet TTRangeSlider *customSlider;

@end

NS_ASSUME_NONNULL_END
