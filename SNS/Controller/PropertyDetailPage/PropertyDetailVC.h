//
//  PropertyDetailVC.h
//  SNS
//
//  Created by Apple on 05/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface PropertyDetailVC : BaseViewController
@property (weak, nonatomic) IBOutlet UICollectionView *propertyDetailCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *similarPropertiesTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
- (IBAction)backBtnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
